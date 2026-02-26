# Repeatable CV Process

Use this workflow for each new job description.

## 1) Put the JD file in this folder
- Example: `JD-NewRole.md`

## 2) Run the generator
```powershell
Set-Location C:\CV\DataManagerTalenza

.\Generate-Application.ps1 `
  -BaseCvMd ".\Sudath-Attanayake-Talenza-Senior-Manager-Data-Integration-ATS-CV-v3.md" `
  -JdMd ".\JD-NewRole.md" `
  -CandidateName "Sudath-Attanayake" `
  -Company "Talenza" `
  -RoleTitle "Senior Manager, Data & Integration" `
  -Version "v1"
```

What it creates:
- CV markdown and docx
- Cover letter markdown and docx
- ATS score JSON report

## 3) Check ATS score in terminal
```powershell
.\Get-AtsScore.ps1 `
  -CvMd ".\Sudath-Attanayake-talenza-senior-manager-data-integration-ATS-CV-v1.md" `
  -JdMd ".\JD-NewRole.md"
```

## Notes
- If `pandoc` is installed, `.docx` files are generated automatically.
- You can rerun with `-Version "v2"`, `-Version "v3"`, etc. for iterations.
