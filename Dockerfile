FROM ollama/ollama:latest

# Install dependencies
USER root
RUN apt-get update && apt-get install -y curl unzip

# Install ngrok
RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && \
    apt-get update && apt-get install -y ngrok

# Set ngrok token
ENV NGROK_AUTHTOKEN=30sYoJavxuXia07uNN5bj0fAJPl_7A8MfXAMiL3oH12ADfbLb

# Override the default entrypoint so we can run multiple commands
ENTRYPOINT ["/bin/sh", "-c"]

# Start Ollama in background, then ngrok
CMD ["ollama serve & ngrok http 11434 --log stdout"]
