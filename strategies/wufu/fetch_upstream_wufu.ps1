$ErrorActionPreference = 'Stop'

$Commit = 'ff83624798271ea6904850b71c4808452b302d88'
$Repository = 'stepven8/wufu-etf-rotation-strategy'
$FileName = '五福_ETF轮动策略.txt'
$ExpectedSha256 = '2f38c126743b1641068fb56d49c41e159fe15933'

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$OutputDir = Join-Path $ScriptDir 'upstream'
$OutputPath = Join-Path $OutputDir $FileName

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

$EncodedName = [System.Uri]::EscapeDataString($FileName)
$RawUrl = "https://raw.githubusercontent.com/$Repository/$Commit/$EncodedName"

Write-Host "Downloading pinned Wufu source: $Repository@$Commit"
Invoke-WebRequest -Uri $RawUrl -OutFile $OutputPath -UseBasicParsing

$ActualSha256 = (Get-FileHash -Path $OutputPath -Algorithm SHA256).Hash.ToLowerInvariant()
if ($ActualSha256 -ne $ExpectedSha256) {
    Remove-Item -Force $OutputPath
    throw "SHA-256 mismatch. Expected $ExpectedSha256, got $ActualSha256. Downloaded file was removed."
}

Write-Host "Verified: $OutputPath"
Write-Host "SHA-256: $ActualSha256"
