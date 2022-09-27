FROM alpine:3.16

# setup working directory
WORKDIR /root/.config/nvim

# install apk packages
RUN apk add --update --no-cache git nodejs npm neovim ripgrep build-base bash libc-dev curl wget openjdk11
RUN apk add --update --no-cache python3-dev && ln -sf python3 /usr/bin/python

# install pip
RUN python3 -m ensurepip

# install neovim dev dependiencies
RUN npm i -g neovim
RUN pip3 install --no-cache-dir --upgrade pip pynvim

# setup rust
ENV PATH="/root/.cargo/bin:${PATH}"
RUN curl https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-musl/rustup-init --output /tmp/rustup-init \
    && chmod +x /tmp/rustup-init \
    && /tmp/rustup-init -y
