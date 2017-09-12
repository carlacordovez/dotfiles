# AUTO GENERATED! DO NOT MODIFY!
# your personal .bash_profile can be found in ~/.dotfiles/.bash_profile
# and is automatically loaded from this file.

DOTFILES_HOME="$HOME/.dotfiles"
export GOPATH="$HOME/go"
export VAGRANT_SERVER_URL="http://artrepo.daptiv.com:8081/artifactory/installs/"
export CONSUL_URL="http://devconsul.daptiv.com"
export NPM_TOKEN="c50ca4f6-4a61-4d17-a081-dbbbf8a0f0e6"
export HOMEBREW_NO_ANALYTICS="1"
export PPM_DEV_VM_IP="192.168.57.101"
export SRC_DIR="$HOME/src"

export PATH="$PATH:$GOPATH/bin:$HOME/.nodenv/shims"
# set open file limit to 3000 which is max before being ignored
ulimit -n 3000

[ -f "$DOTFILES_HOME/.bash_profile" ] && source $DOTFILES_HOME/.bash_profile
[ -f "$HOME/.bashrc" ] && source $HOME/.bashrc
