FROM ollama/ollama:latest

# Expose Ollama's default port
EXPOSE 11434

# Environment variable to make it accessible from outside
ENV OLLAMA_HOST=0.0.0.0

# Use shell form of CMD so multiple commands can run
CMD /bin/sh -c "ollama serve & sleep 5 && ollama pull deepseek-coder-v2-lite-instruct && wait"
