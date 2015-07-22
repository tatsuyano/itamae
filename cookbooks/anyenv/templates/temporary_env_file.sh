export PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init -)"

if [ -e /home/<%= @user %>/.anyenv/envs/<%= @env %> ]; then
  export PATH=$HOME/.anyenv/envs/<%= @env %>/bin:$PATH
  export PATH=$HOME/.anyenv/envs/<%= @env %>/plugins/<%= @lang %>-build/bin:$PATH
  eval "$(<%= @env %> init -)"
fi
