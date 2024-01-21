# Stage 1: Build the base image
FROM gitpod/workspace-full AS base

# Install Tailscale
USER root
RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | apt-key add - \
    && curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | tee /etc/apt/sources.list.d/tailscale.list \
    && apt-get update \
    && apt-get install -y tailscale

# Install Caddy and Cloudflared
RUN apt-get install -y debian-keyring debian-archive-keyring apt-transport-https \
    && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | apt-key add - \
    && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list \
    && apt-get update \
    && apt-get install -y caddy \
    && curl -sSL https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb -o cloudflared.deb \
    && dpkg -i cloudflared.deb \
    && rm cloudflared.deb

# Set fish as default shell
RUN chsh -s /usr/bin/fish gitpod

# Stage 2: Configure fish shell and install tools
FROM base AS configure

# Install fisher
USER gitpod
RUN curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Install fish plugins
RUN fisher install jethrokuan/z \
    && fisher install jorgebucaran/fishtape \
    && fisher install edc/bass \
    && fisher install jorgebucaran/nvm.fish \
    && fisher install FabioAntunes/fish-nvm \
    && fisher install fishpkg/fish-async-prompt \
    && fisher install jorgebucaran/fish-git-util

# Stage 3: Install Wrangler for Cloudflare Workers
FROM configure AS final

USER root
RUN apt-get update \
    && apt-get install -y nodejs npm \
    && npm install -g @cloudflare/wrangler

USER gitpod
