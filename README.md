# Homebrew Tap for Pamie

Install Pamie with Homebrew:

```sh
brew install kurocho/tap/pamie
```

Or tap the repository first:

```sh
brew tap kurocho/tap
brew install pamie
```

Run Pamie locally:

```sh
export PAMIE_TOKEN="$(openssl rand -hex 32)"
export PAMIE_TOKEN_ID=local
export PAMIE_TOKEN_SCOPES=all

pamie --addr 127.0.0.1:8080 --data-dir ./data
```

Check the server:

```sh
curl http://127.0.0.1:8080/health
curl http://127.0.0.1:8080/ready
```

Pamie source: <https://github.com/kurocho/pamie>

Website: <https://pamie.io>
