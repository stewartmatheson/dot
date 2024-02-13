FROM ubuntu
RUN [ "apt", "update" ]
RUN [ "apt", "install", "-y", "zsh", "git", "neovim" ]
COPY . /root/dot
WORKDIR "/root/dot"
#RUN ["zsh", "./setup"]

