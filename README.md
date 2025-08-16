# ByBit_Bot
Bybit auto trade bot with gainers Ver.4

# Bybit Spot Gainers Bot
Net Take-Profit (after both fees) -  Calculates real profit, not glossy gross PnL.
FIFO cleanup + emergency top-up  -  Auto-sells dust “tails” and raises USDT to meet minimum order size—no error loops.
Backoff / anti-spam - On 170131 / 401 the bot backs off intelligently instead of hammering the API.
Hard caps on open positions (atomic)  -  Per-symbol and global limits that can’t be exceeded, even under thread races.
Gainers PRO (lightweight screener)  -  Picks pairs by 24h volume, tight spread, EMA trend, and ATR volatility, with auto-refresh.
Honest logs  -  Keeps full Request → … payloads for diagnosis + quick status with s + Enter.
.env-driven config  -  Everything is customizable—per-symbol TP/SL/quote size, trailing, USDT reserve, etc.
Local, no lock-in  -  Your API keys stay with you; runs on Termux/Android; easy to extend and hack.

## Quick start
```bash
git clone <YOUR_REPO_URL>
cd <repo>
python -m venv .venv && . .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env   # fill BYBIT_API_KEY/SECRET
python bybit_spot_bot.py

