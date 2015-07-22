export PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init -)"

if [ -e /home/<%= @user %>/.anyenv/envs/ndenv ]; then
  export PATH=$HOME/.anyenv/envs/ndenv/bin:$PATH
  export PATH=$HOME/.anyenv/envs/ndenv/plugins/node-build/bin:$PATH
  eval "$(ndenv init -)"
fi
