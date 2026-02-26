[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$CvMd,

    [Parameter(Mandatory = $true)]
    [string]$JdMd,

    [switch]$AsJson
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $CvMd)) {
    throw "CV file not found: $CvMd"
}
if (-not (Test-Path -LiteralPath $JdMd)) {
    throw "JD file not found: $JdMd"
}

$cv = (Get-Content -Raw -LiteralPath $CvMd).ToLowerInvariant()
$jd = (Get-Content -Raw -LiteralPath $JdMd).ToLowerInvariant()

$criteria = @(
    @{ Name = "role title alignment"; Weight = 8; Mode = "any"; Patterns = @("senior manager", "data integration", "data & integration") },
    @{ Name = "enterprise data strategy"; Weight = 7; Mode = "any"; Patterns = @("enterprise data strategy", "data strategy") },
    @{ Name = "current-state assessment"; Weight = 6; Mode = "any"; Patterns = @("current-state", "current state", "assess", "review the existing data landscape") },
    @{ Name = "uplift roadmap"; Weight = 6; Mode = "any"; Patterns = @("uplift roadmap", "roadmap") },
    @{ Name = "warehouse/lakehouse delivery"; Weight = 10; Mode = "any"; Patterns = @("data warehouse", "lakehouse", "medallion", "bronze", "silver", "gold") },
    @{ Name = "azure platform capability"; Weight = 10; Mode = "any"; Patterns = @("azure", "microsoft fabric", "azure sql", "azure data factory") },
    @{ Name = "dimensional modeling"; Weight = 6; Mode = "any"; Patterns = @("dimensional model", "dimensional data model") },
    @{ Name = "power bi advanced"; Weight = 12; Mode = "threshold3"; Patterns = @("power bi", "dax", "semantic model", "deployment pipeline") },
    @{ Name = "governance and quality"; Weight = 8; Mode = "any"; Patterns = @("governance", "metadata", "lineage", "data quality", "standards") },
    @{ Name = "master data management"; Weight = 6; Mode = "any"; Patterns = @("master data management", "\bmdm\b") },
    @{ Name = "etl/elt and integration"; Weight = 8; Mode = "any"; Patterns = @("etl", "elt", "pipeline", "integration") },
    @{ Name = "sql depth"; Weight = 7; Mode = "any"; Patterns = @("\bsql\b", "sql server", "azure sql") },
    @{ Name = "stakeholder leadership"; Weight = 6; Mode = "any"; Patterns = @("stakeholder", "vendor", "executive", "cio") }
)

$max = 0
$score = 0
$details = @()

foreach ($c in $criteria) {
    $max += [int]$c.Weight
    $matched = $false
    $hits = 0

    foreach ($p in $c.Patterns) {
        if ($cv -match $p) { $hits++ }
    }

    switch ($c.Mode) {
        "threshold3" { $matched = $hits -ge 3 }
        default { $matched = $hits -ge 1 }
    }

    if ($matched) { $score += [int]$c.Weight }

    $details += [PSCustomObject]@{
        criterion = $c.Name
        weight = [int]$c.Weight
        matched = $matched
        hits = $hits
    }
}

$pct = [Math]::Round(($score * 100.0 / $max), 1)

$result = [PSCustomObject]@{
    cv_file = (Resolve-Path -LiteralPath $CvMd).Path
    jd_file = (Resolve-Path -LiteralPath $JdMd).Path
    score = $score
    max = $max
    percent = $pct
    details = $details
    note = "This is an estimated ATS-style keyword/requirement alignment score."
}

if ($AsJson) {
    $result | ConvertTo-Json -Depth 6
}
else {
    "ATS Score: $score/$max ($pct%)"
    $details | Format-Table -AutoSize | Out-String
}
