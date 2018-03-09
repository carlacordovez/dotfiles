cask_args appdir: "/Applications"
brew "rbenv"
brew "nodenv"
cask "java"

# virtualization
brew "nginx", restart_service: :changed
cask "virtualbox"
cask "virtualbox-extension-pack"
cask "vagrant"
cask "vagrant-manager"
cask "docker"

# terminal
cask "iterm2"

# text editors
cask "atom"
cask "sublime-text"

# communication
cask "slack"

# tools
brew "dnsmasq"
brew "hub"
cask "trailer"
cask "caffeine"
brew "go"
brew "gawk"

# awscli has a dependency on 'python' which was recently updated to install python 3 instead of python2
#  this breaks node-gyp. until this gets sorted out, we will not automatically install awscli
# brew "awscli"

brew "git-flow-avh"
cask "postman"
brew "hostess"
brew "coreutils"

# browsers
cask "google-chrome"
cask "firefox"
