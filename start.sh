#!/bin/sh

ollama serve &
sleep 5

ollama pull deepseek-coder-v2-lite-instruct

ngrok http 11434
