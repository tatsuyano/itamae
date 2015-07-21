# roles/vagrant

include_recipe "../cookbooks/basic-command/default.rb"
include_recipe "../cookbooks/emacs/default.rb"
include_recipe "../cookbooks/golang/default.rb"
include_recipe "../cookbooks/golang/directory_layout_and_ghq.rb"
include_recipe "../cookbooks/zsh/default.rb"
include_recipe "../cookbooks/zsh/oh-my-zsh.rb"
include_recipe "../cookbooks/peco/default.rb"
