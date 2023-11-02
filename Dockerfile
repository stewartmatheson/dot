FROM alpine
RUN ["apk", "add", "bash", "zsh", "git", "tmux", "exa", "neovim", "alpine-sdk"]
ENV HOME /home

WORKDIR "/home"
ADD . ./dot

WORKDIR "/home/dot"
RUN ["bash", "./setup"]

WORKDIR "/home"
CMD ["zsh"]
