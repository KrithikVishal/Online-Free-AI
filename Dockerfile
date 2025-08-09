FROM ollama/ollama:latest

# Set the host to 0.0.0.0 so it works on Railway
ENV OLLAMA_HOST=0.0.0.0

# Pull DeepSeek model at build time
RUN ollama pull deepseek-coder-v2-lite-instruct

EXPOSE 11434

# Start Ollama server
CMD ["ollama", "serve"]
