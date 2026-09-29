param(
  [ValidateSet("codex", "claude", "both")]
  [string]$Mode = "both"
)

$ErrorActionPreference = "Stop"
$PackageDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Stamp = Get-Date -Format "yyyyMMdd-HHmmss"

function Install-Skills([string]$TargetRoot) {
  New-Item -ItemType Directory -Force -Path $TargetRoot | Out-Null
  foreach ($SkillName in @("brd-create", "brd-help")) {
    $SourceDir = Join-Path $PackageDir "skills/$SkillName"
    $TargetDir = Join-Path $TargetRoot $SkillName
    if (Test-Path $TargetDir) {
      $BackupDir = "$TargetDir.backup-$Stamp"
      Move-Item $TargetDir $BackupDir
      Write-Host "Backed up: $BackupDir"
    }
    Copy-Item -Recurse $SourceDir $TargetDir
    Write-Host "Installed: $TargetDir"
  }
}

if ($Mode -eq "codex" -or $Mode -eq "both") {
  $CodexRoot = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME ".codex" }
  Install-Skills (Join-Path $CodexRoot "skills")
}

if ($Mode -eq "claude" -or $Mode -eq "both") {
  Install-Skills (Join-Path $HOME ".claude/skills")
}

Write-Host "Done. Start a new Codex task or run /reload-skills in Claude Code."
