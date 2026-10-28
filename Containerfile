FROM node:24-slim
RUN apt-get update && apt-get install -y --no-install-recommends ripgrep fd-find git ca-certificates curl wget jq xq tree vim-tiny yq file procps less openssl psmisc patch shellcheck && rm -rf /var/lib/apt/lists/*
RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent
WORKDIR /workspace
ENV EDITOR=/usr/bin/vim.tiny VISUAL=/usr/bin/vim.tiny TERM=xterm-256color LANG=C.UTF-8
ENTRYPOINT ["/usr/local/bin/pi"]
