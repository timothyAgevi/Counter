FROM debian:bookworm-slim

ENV SHELL=/bin/bash

RUN apt update && apt install -y \
    git \
    curl

RUN curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh