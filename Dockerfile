# Use the official Rust image as a base
FROM rust:latest

# Install dependencies for X11 forwarding and WASM toolchain
RUN apt-get update && apt-get install -y \
    libx11-dev \
    libgl1-mesa-glx \
    libegl1-mesa \
    x11-apps \
    curl \
    build-essential \
    pkg-config \
    git \
    cmake \
    clang \
    libssl-dev \
    libclang-dev \
    libcurl4-openssl-dev \
    libz-dev \
    && rm -rf /var/lib/apt/lists/*

# Install wasm32 target for Rust
RUN rustup target add wasm32-unknown-unknown

# Make sure the Linux target is available
RUN rustup target add x86_64-unknown-linux-gnu

# Set up the working directory
WORKDIR /usr/src/app

# Set the default command to start a bash shell
CMD ["bash"]
