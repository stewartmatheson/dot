
# check if we have start gui and not in tmux
if [ -x "$(command -v start-gui)" ] && [ -z "$TMUX" ] ; then
  exec start-gui
fi
