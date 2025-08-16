# ByBit_Bot
# Bybit auto trade bot with gainers Ver.4

# Bybit Spot Gainers Bot

# Lean, configurable, battle-tested spot scalper. **Net TP (after fees)**, **FIFO cleanup + emergency top-up**, **anti-spam backoff**, **atomic caps on open positions**, # and a lightweight **Gainers PRO** screener (spread, EMA trend, ATR, volume) with auto-refresh. Local-first, no lock-in, Termux-ready. Hackable by design.

## Key features
#- **Net Take-Profit:** real profit after both fees.
#- **FIFO cleanup + top-up:** auto-sells dust, raises USDT to meet min order.
#- **Backoff/anti-spam:** smart pauses on `170131/401`.
#- **Atomic limits:** per-pair & global open-position caps.
#- **Gainers PRO screener:** spread, EMA(5m) trend, ATR(5m), volume; auto-refresh.
#- **Honest logs:** full `Request → …` + quick status (`s + Enter`).
#- **.env config:** per-symbol TP/SL/size, trailing, USDT reserve, etc.
#- **Local-first:** keys stay with you; Termux/Android supported.

## Quick start
```bash
sudo apt update && sudo apt upgrade
sudo apt update && sudo apt install -y python3 python3-venv python3-pip
git clone <YOUR_REPO_URL>
cd <repo>
python -m venv .venv && . .venv/bin/activate
pip install -U pybit python-dotenv requests
pip install -r requirements.txt
cp .env.example .env   # fill BYBIT_API_KEY/SECRET
python bybit_spot_bot.py

## Linux/macOS
chmod +x run.sh
./run.sh

## Windows
## Powershell in /ByBit_Bot
.\run.ps1

## You can run it on termux/android too :)

### Roadmap

# - [ ] **Alerts (Telegram/Discord)** 
# - [ ] **Healthcheck + auto-restart** 
# - [ ] **Docker (optional)**.
# - [ ] **Stats HUD** 
# - [ ] **Auto-convert dust**
# - [ ] **Persistent state** 
# - [ ] **Screener+**
# - [ ] **Dry-run/Testnet switch**
# - [ ] **Config validation**
# - [ ] **CI / pre-commit** 


# - [ ] **AI Co-Manager (token-gated)** — the bot gets a built-in AI operator that proposes actions and manages risk, but execution is **rate-limited and gated by tokens**
# - **Propose → Approve flow:** AI proposes trade/param change; executes only after APPROVE or N-of-M approvals.
# - **Role tiers:** Viewer / Trader / Manager — mapped to token balances (or a simple `roles.json` first).
# - **Hard guards:** daily loss cap, per-trade cap, cooldowns, kill-switch; AI can’t exceed caps.
# - **Audit log:** every AI decision recorded (reason, inputs, limits hit).
# - **Pluggable backends:** start off-chain (JSON + signatures), optional on-chain later.

### Vision
#  Human intent + AI speed, **under hard risk caps**. The AI runs ops; tokens and approvals keep it honest.


