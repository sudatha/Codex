[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$JdMd,

    [Parameter(Mandatory = $true)]
    [string]$BaseCvMd,

    [string]$CandidateName = "Sudath-Attanayake",
    [string]$OutputDir = ".",
    [string]$Version = "v1",
    [string]$Company,
    [string]$RoleTitle
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-Slug {
    param([string]$Value)
    if ([string]::IsNullOrWhiteSpace($Value)) { return "" }
    $slug = $Value.ToLowerInvariant()
    $slug = $slug -replace "&", " and "
    $slug = $slug -replace "[^a-z0-9]+", "-"
    $slug = $slug -replace "-{2,}", "-"
    return $slug.Trim("-")
}

function Get-CandidatePart {
    param([string]$Value)
    $part = $Value -replace "\s+", "-"
    $part = $part -replace "[^A-Za-z0-9-]", ""
    $part = $part -replace "-{2,}", "-"
    return $part.Trim("-")
}

if (-not (Test-Path -LiteralPath $JdMd)) {
    throw "JD file not found: $JdMd"
}
if (-not (Test-Path -LiteralPath $BaseCvMd)) {
    throw "Base CV file not found: $BaseCvMd"
}
if (-not (Test-Path -LiteralPath $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

$jdPath = (Resolve-Path -LiteralPath $JdMd).Path
$baseCvPath = (Resolve-Path -LiteralPath $BaseCvMd).Path
$outPath = (Resolve-Path -LiteralPath $OutputDir).Path

$jdLines = Get-Content -LiteralPath $jdPath |
ForEach-Object { $_.Trim() } |
Where-Object { $_ -ne "" }

if (-not $RoleTitle) {
    $RoleTitle = $jdLines |
    Where-Object { $_ -notmatch "^(#|job description\b)" } |
    Select-Object -First 1
}

if (-not $Company) {
    $companyLine = $jdLines |
    Where-Object { $_ -match "\s-\s" -or $_ -match "\|" } |
    Select-Object -First 1

    if ($companyLine -and $companyLine -match "^([A-Za-z0-9& ]+?)\s*[-|]") {
        $Company = $Matches[1].Trim()
    }
}

if ([string]::IsNullOrWhiteSpace($RoleTitle)) { $RoleTitle = "Role" }
if ([string]::IsNullOrWhiteSpace($Company)) { $Company = "Company" }

$candidatePart = Get-CandidatePart -Value $CandidateName
$companySlug = Get-Slug -Value $Company
$roleSlug = Get-Slug -Value $RoleTitle

$cvMdName = "$candidatePart-$companySlug-$roleSlug-ATS-CV-$Version.md"
$cvDocxName = "$candidatePart-$companySlug-$roleSlug-ATS-CV-$Version.docx"
$clMdName = "$candidatePart-$companySlug-$roleSlug-Cover-Letter-$Version.md"
$clDocxName = "$candidatePart-$companySlug-$roleSlug-Cover-Letter-$Version.docx"
$atsJsonName = "$candidatePart-$companySlug-$roleSlug-ATS-Score-$Version.json"

$cvMdOut = Join-Path $outPath $cvMdName
$cvDocxOut = Join-Path $outPath $cvDocxName
$clMdOut = Join-Path $outPath $clMdName
$clDocxOut = Join-Path $outPath $clDocxName
$atsJsonOut = Join-Path $outPath $atsJsonName

$baseFull = [System.IO.Path]::GetFullPath($baseCvPath)
$outFull = [System.IO.Path]::GetFullPath($cvMdOut)
if ($baseFull -ieq $outFull) {
    Write-Warning "Output CV path matches base CV path. Skipping CV copy to avoid overwrite."
}
else {
    Copy-Item -LiteralPath $baseCvPath -Destination $cvMdOut -Force
}

$baseLines = Get-Content -LiteralPath $baseCvPath
$displayName = (($baseLines | Select-Object -First 1) -replace "^#\s*", "").Trim()
$contactLine1 = ($baseLines | Select-Object -Skip 1 -First 1)
$contactLine2 = ($baseLines | Select-Object -Skip 2 -First 1)
$today = Get-Date -Format "dd MMMM yyyy"

$coverLetter = @"
$displayName
$contactLine1
$contactLine2

$today

Hiring Manager
$Company

Dear Hiring Manager,

I am applying for the $RoleTitle role. My background in data engineering, integration, and analytics aligns strongly with your requirements, and I am comfortable combining strategy with hands-on delivery.

I have focused on enterprise data platform uplift, ETL/ELT design, SQL-based engineering, and Power BI capability uplift including DAX, semantic models, and deployment pipelines. I also bring experience with governance, data quality, and delivery leadership across complex stakeholder environments.

I would welcome the opportunity to discuss how I can help deliver your data and integration roadmap.

Yours sincerely,
$displayName
"@

Set-Content -LiteralPath $clMdOut -Value $coverLetter -Encoding UTF8

$pandoc = Get-Command pandoc -ErrorAction SilentlyContinue
if ($pandoc) {
    & $pandoc.Source $cvMdOut -o $cvDocxOut
    & $pandoc.Source $clMdOut -o $clDocxOut
}

$atsScript = Join-Path $PSScriptRoot "Get-AtsScore.ps1"
if (Test-Path -LiteralPath $atsScript) {
    $ats = & $atsScript -CvMd $cvMdOut -JdMd $jdPath -AsJson
    Set-Content -LiteralPath $atsJsonOut -Value $ats -Encoding UTF8
}

[PSCustomObject]@{
    JdFile = $jdPath
    BaseCv = $baseCvPath
    OutputCvMd = $cvMdOut
    OutputCvDocx = $(if (Test-Path -LiteralPath $cvDocxOut) { $cvDocxOut } else { "" })
    OutputCoverLetterMd = $clMdOut
    OutputCoverLetterDocx = $(if (Test-Path -LiteralPath $clDocxOut) { $clDocxOut } else { "" })
    OutputAtsJson = $(if (Test-Path -LiteralPath $atsJsonOut) { $atsJsonOut } else { "" })
} | Format-List
