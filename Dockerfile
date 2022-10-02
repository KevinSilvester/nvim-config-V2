FROM alpine:edge


# install build tools
RUN apk add --update --no-cache cmake automake autoconf libtool pkgconf coreutils unzip gettext-tiny-dev

# install packages
RUN apk add --update --no-cache git build-base nodejs npm ripgrep bash libc-dev curl wget openjdk11
RUN apk add --update --no-cache python3-dev && ln -sf python3 /usr/bin/python

# install pip
RUN python3 -m ensurepip

# build neovim-v8.0
WORKDIR /tmp
RUN git clone "https://github.com/neovim/neovim.git"
WORKDIR /tmp/neovim
RUN git checkout stable
RUN make CMAKE_BUILD_TYPE=Release
RUN make install

# install neovim helpers
RUN npm i -g neovim
RUN pip3 install --no-cache-dir --upgrade pip pynvim

# setup rust
ENV PATH="/root/.cargo/bin:${PATH}"
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# setup working directory
WORKDIR /root/.config/nvim