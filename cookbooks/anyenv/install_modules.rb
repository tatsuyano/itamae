# -*- coding: utf-8 -*-

define :install_modules, cmd: nil do

  lang = params[:name]  
  envs = { 'node' => 'ndenv', 'ruby' => 'rbenv', 'perl' => 'plenv', 'python' => 'pyenv' }
  env  = envs[lang]
  template "temporary_env_file.sh" do
    source "templates/temporary_env_file.sh"
    variables(user: node[:user], lang: lang, env: env)
  end

  # Add 'source ruby_env.sh' to command
  cmd = sprintf "source /home/#{node[:user]}/temporary_env_file.sh\n%s", params[:cmd]

  execute "install" do
    user node[:user]
    command cmd
  end

  file "temporary_env_file.sh" do
    action :delete
  end
end
