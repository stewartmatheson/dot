FROM ubuntu
RUN [ "apt", "update" ]
RUN [ "apt", "install", "-y", "zsh", "git", "curl", "gcc" ]
COPY . /root/dot

WORKDIR "/root/dot"
RUN ["zsh", "./setup"]

WORKDIR "/root"
CMD ["zsh"]

