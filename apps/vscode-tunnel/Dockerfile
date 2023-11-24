FROM ghcr.io/onedr0p/alpine:3.18.4

RUN apk add --no-cache git curl nodejs-lts openssh alpine-zsh-config && \
    curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64" \
        --output /tmp/vscode-cli.tar.gz && \
    tar -xf /tmp/vscode-cli.tar.gz -C /usr/bin && \
    rm /tmp/vscode-cli.tar.gz && \
    rm -rf \
	    /root/.cache \
	    /tmp/*
USER kah

ENV VSCODE_CLI_USE_FILE_KEYRING="true"
VOLUME [ "/vscode-server/.vscode-cli", "/vscode-server/.vscode-server", "/tmp", "/vscode-server/workspace" ]
CMD [ "code", "tunnel", "--accept-server-license-terms" ]
