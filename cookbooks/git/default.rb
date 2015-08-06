# -*- coding: utf-8 -*-

package 'curl-devel'
package 'expat-devel'
package 'gettext-devel'
package 'openssl-devel'
package 'zlib-devel'
package 'perl-ExtUtils-MakeMaker'

execute "Install git(not yum install)" do
  user node[:user]
  command <<-EOF
    export GOPATH=/home/#{node[:user]}
    export PATH=$GOPATH/bin:$PATH
    ghq get https://github.com/git/git.git

    sudo yum -y remove git

    cd src/github.com/git/git
    make all prefix=/usr
    sudo make install prefix=/usr
  EOF
end
