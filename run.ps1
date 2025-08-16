$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
  Write-Error "Python is required"; exit 1
}

if (-not (Test-Path .\.venv)) {
  python -m venv .venv
}
.\.venv\Scripts\Activate.ps1

python -m pip -q install --upgrade pip
pip install -r requirements.txt

if (-not (Test-Path .\.env)) {
  Copy-Item .env.example .env
  Write-Host ">> Created .env. Fill BYBIT_API_KEY/SECRET and rerun."
  exit 1
}

(Get-Content .env) -match 'BYBIT_API_(KEY|SECRET)=(\s*)$' | Out-Null
if ($LASTEXITCODE -eq 0) {
  Write-Error "Fill BYBIT_API_KEY/SECRET in .env first."; exit 1
}

python bybit_spot_bot.py

