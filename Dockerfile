FROM ollama/ollama:latest

# Pull DeepSeek model at build time
RUN ollama pull deepseek-coder-v2-lite-instruct

EXPOSE 11434

# Run Ollama server
CMD ["ollama", "serve"]
