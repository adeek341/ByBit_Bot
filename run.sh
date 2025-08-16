#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

PY=python3
command -v "$PY" >/dev/null || { echo "Python3 required"; exit 1; }

# venv
[ -d .venv ] || $PY -m venv .venv
. .venv/bin/activate

# deps
python -m pip -q install --upgrade pip
pip install -r requirements.txt

# .env
if [ ! -f .env ]; then
  cp .env.example .env
  echo ">> Created .env. Fill BYBIT_API_KEY/SECRET and rerun."
  exit 1
fi
if grep -E 'BYBIT_API_(KEY|SECRET)=(|[[:space:]]*)$' .env >/dev/null; then
  echo ">> Fill BYBIT_API_KEY/SECRET in .env first."
  exit 1
fi

exec python bybit_spot_bot.py

