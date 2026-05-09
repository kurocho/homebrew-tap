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
pamie start
pamie status
```

The first `pamie start` run starts the local background server and prints a generated Bearer token once. Run `pamie token` to rotate the default token, and `pamie stop` to stop the background server.

Pamie v1.1.0 enables local vector search by default with `local-hash`. Switch to Ollama semantic embeddings with:

```sh
ollama serve
ollama pull embeddinggemma
pamie start --vector-provider ollama
```

Check the server:

```sh
curl http://127.0.0.1:17683/health
curl http://127.0.0.1:17683/ready
```

Pamie source: <https://github.com/kurocho/pamie>

Website: <https://pamie.io>
