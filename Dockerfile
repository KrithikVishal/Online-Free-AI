FROM ollama/ollama:latest

# Expose Ollama default port
EXPOSE 11434

# Set environment variable so Ollama listens on all interfaces
ENV OLLAMA_HOST=0.0.0.0

# Start Ollama server in background, wait for it, then pull the model, then keep running
CMD ["sh", "-c", "ollama serve & sleep 5 && ollama pull deepseek-coder-v2-lite-instruct && wait"]
