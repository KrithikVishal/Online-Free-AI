FROM ollama/ollama:latest

EXPOSE 11434
ENV OLLAMA_HOST=0.0.0.0

# Override entrypoint so we can run a shell
ENTRYPOINT ["/bin/sh", "-c"]

# Start Ollama server in background, wait, then pull model
CMD "ollama serve & sleep 5 && ollama pull deepseek-coder-v2-lite-instruct && wait"
