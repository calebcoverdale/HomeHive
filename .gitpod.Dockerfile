FROM gitpod/workspace-full

USER root

# Install Tailscale
RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | apt-key add -
RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | tee /etc/apt/sources.list.d/tailscale.list
RUN apt-get update
RUN apt-get install tailscale

# Install Caddy
RUN apt-get install -y debian-keyring debian-archive-keyring apt-transport-https
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | apt-key add -
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
RUN apt-get update
RUN apt-get install caddy

# Install Cloudflared
RUN curl -sSL https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb -o cloudflared.deb
RUN dpkg -i cloudflared.deb
RUN rm cloudflared.deb

USER gitpod

# Set fish as default shell
RUN sudo chsh -s /usr/bin/fish gitpod

# Install fisher
RUN curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Install fish plugins
RUN fisher install jethrokuan/z
RUN fisher install jorgebucaran/fishtape
RUN fisher install edc/bass
RUN fisher install jorgebucaran/nvm.fish
RUN fisher install FabioAntunes/fish-nvm
RUN fisher install fishpkg/fish-async-prompt
RUN fisher install jorgebucaran/fish-git-util

# Install Wrangler for Cloudflare Workers
RUN npm install -g @cloudflare/wrangler