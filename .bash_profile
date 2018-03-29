# AUTO GENERATED! DO NOT MODIFY!
# your personal .bash_profile can be found in ~/.dotfiles/.bash_profile
# and is automatically loaded from this file.

DOTFILES_HOME="$HOME/.dotfiles"
export PROFILE_LOADED="1"
export GOPATH="$HOME/go"
export VAGRANT_SERVER_URL="http://artrepo.daptiv.com:8081/artifactory/installs/"
export CONSUL_URL="http://devconsul.daptiv.com"
export NPM_TOKEN="dd5e6d9d-f242-442b-b003-aee90d13f949"
export HOMEBREW_NO_ANALYTICS="1"
export COGNOS_VM_IP="192.168.57.102"
export PPM_DEV_VM_IP="192.168.57.101"
export PPM_VM_IP="$PPM_DEV_VM_IP" # some scripts require this
export SRC_DIR="$HOME/src"
export NGINX_CONFIG_DIR="/usr/local/etc/nginx"
export NGINX_SITES_CONFIG_DIR="$NGINX_CONFIG_DIR/servers"
export NGINX_LOG_DIR="/usr/local/var/log/nginx"
export NGINX_FOXGLOVE_UPSTREAMS_DIR="$NGINX_CONFIG_DIR/foxglove-upstreams"
export NGINX_FOXGLOVE_LOCATIONS_DIR="$NGINX_CONFIG_DIR/foxglove-locations"

export PATH="$HOME/.nodenv/shims:$PATH:$GOPATH/bin"
# set open file limit to 3000 which is max before being ignored
ulimit -n 3000

strap() {
  #need STRAP_GITHUB_USER to be able to fetch user dotfiles repo
  export STRAP_GITHUB_USER=${STRAP_GITHUB_USER:-"$( git config --global --get github.user )"}
  bash ~/src/strap/bin/strap.sh $@
}

vmstart() {
  VBoxManage startvm ${1:-dev_ppm} --type headless
}

vmstop() {
  VBoxManage controlvm ${1:-dev_ppm} poweroff
}

if which rbenv 2>&1 >/dev/null; then
  eval "$(rbenv init -)"
fi

[ -f "$DOTFILES_HOME/.bash_profile" ] && source $DOTFILES_HOME/.bash_profile
[ -f "$HOME/.bashrc" ] && source $HOME/.bashrc
