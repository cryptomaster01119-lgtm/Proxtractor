# 📡 Proxy Checker — README 📝

A small, fast asynchronous proxy extractor + validator written in Python. 🐍
Reads a list of proxy source URLs (plain or Base64-obfuscated), downloads proxy lists (HTML or raw `.txt`), extracts `IP:PORT` entries, verifies them against `https://api.ipify.org`, and writes working proxies to `valid_proxies.txt`. ✅

---

## ⚡ Features

* Asynchronous checks with `aiohttp` and `aiohttp_socks` 🚀
* Supports HTTP, SOCKS4 and SOCKS5 checks 🌐
* Accepts `sources.txt` in either plaintext URLs or Base64-obfuscated 🗂️
* Live progress bar with `tqdm` and a live count of valid proxies found 📊
* Lightweight, portable and works on Termux / Linux / macOS 💻

---

## 📦 Requirements

Install Python 3.8+ and the required packages:

```bash
pip install aiohttp aiohttp-socks beautifulsoup4 tqdm
```

On Termux:

```bash
pkg update -y
pkg install python -y
pip install aiohttp aiohttp-socks beautifulsoup4 tqdm
```

---

## 📂 Files

* `main.py` — main script (extracts + validates proxies) 📝
* `sources.txt` — each line is a source URL (plain or Base64). You may keep this file local and add it to `.gitignore` if you don't want to publish it 🔒
* `valid_proxies.txt` — output file containing validated proxies in the format `scheme://ip:port` (one per line) 📜

---

## ▶️ Usage

1. Put your sources in `sources.txt`. Each line may be:

   * a plain URL (e.g. `https://example.com/list.txt`) 🌍
   * OR a Base64-encoded URL (the script auto-detects and decodes it) 🔐

2. Run the script:

```bash
python main.py
```

3. After it finishes, working proxies are in `valid_proxies.txt` ✅

---

## 📝 Example `sources.txt`

Plain URLs:

```
https://raw.githubusercontent.com/some/repo/master/proxies.txt
https://free-proxy-list.net/
```

Or Base64-encoded (script supports both):

```
aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3Byby9wcm94eXMudHh0
``` (the base sources.txt has about `1.023.119` proxys to be verified.)

---

## 🚫 Recommended `.gitignore`

Do not commit secrets, local outputs or virtual environments:

```
__pycache__/
*.pyc
.env
venv/
valid_proxies.txt
sources.txt   # if you want to keep your sources private
```

---

## 💡 Tips & Troubleshooting

* **Empty results**: many public proxy sites block non-browser clients 🌐. If you get 0 candidates:

  * Verify the URL is reachable from your environment (curl the URL manually) 🔍
  * Use a simpler source (raw `.txt` lists are easiest) 📄
  * Reduce concurrency if you get connection errors or rate limits ⚙️

* **Termux issues**: keep dependencies up-to-date and use Python from Termux package repos 🐧

* **Performance**: `CONCURRENT_CHECKS` controls parallel checks. Increase for faster testing (higher resource usage), lower for stability 🔧

* **Obfuscation**: Base64 obfuscation only hides URLs from casual viewers 🕵️‍♂️

---

## ⚖️ Security & Legal Notes

* Proxies pulled from public lists can be unreliable, malicious, or illegal to use depending on jurisdiction and purpose ⚠️
* Do not use proxies to perform abusive or unauthorized actions 🚫
* The script connects to many third-party endpoints; run in a controlled environment 🔒

---

## 🛠️ Customization

* `CHECK_URL` — change the URL used to validate outbound IP 🌍
* `TIMEOUT_SECONDS` — adjust network timeout ⏱️
* `CONCURRENT_CHECKS` — tweak concurrency to match your environment ⚡

---

## 📜 License

Add a license file to the repository (for example MIT) if you plan to publish:

```
MIT License
```

---

Made with ❤️ for proxy enthusiasts.
