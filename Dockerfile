FROM ollama/ollama:latest

RUN apt-get update && apt-get install -y curl unzip

RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && \
    apt-get update && apt-get install -y ngrok

ENV NGROK_AUTHTOKEN=30sYoJavxuXia07uNN5bj0fAJPl_7A8MfXAMiL3oH12ADfbLb
ENV OLLAMA_HOST=0.0.0.0

ENTRYPOINT ["/bin/sh", "-c"]

CMD "ollama serve & sleep 5 && ollama pull deepseek-coder-v2-lite-instruct && wait"
