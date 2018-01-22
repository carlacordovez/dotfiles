#!/usr/bin/env bash

log-msg () {
  clr_green='\033[92m'
  clr_yellow='\033[93m'
  clr_red='\033[91m'
  clr_default='\033[39m'

  while [ "$1" != '' ]; do
    case $1 in
      -g|--green)
        echo -en "$clr_green"
        ;;
      -y|--yellow)
        echo -en "$clr_yellow"
        ;;
      -r|--red)
        echo -en "$clr_red"
        ;;
      -d|--default)
        echo -e "$clr_default"
        ;;
      *)
        echo -e "$1"
        ;;
    esac
    shift
  done
  echo -e "$clr_default"
}

log-warn() {
  first=$1
  shift
  log-msg --yellow "WARNING: $first" $*
}

init-git-flow-for-repo() {
  repo="$1"
  repo_dir="$SRC_DIR/$repo"
  config_file="$repo_dir/.git/config"

  if [ -f "$config_file" ]; then
  	if ! grep -q '\[gitflow' $config_file ; then
      log-msg "setting up git flow for $repo..."
      tee -a "$config_file" <<EOF
[gitflow "branch"]
  master = master
  develop = dev
[gitflow "prefix"]
  feature = feature/
  bugfix = bugfix/
  release = release/
  hotfix = hotfix/
  support = support/
  versiontag =
[gitflow "path"]
  hooks = ${repo_dir}/.git/hooks
[gitflow "hotfix.finish"]
  push = true
[gitflow "release.finish"]
  push = true
[gitflow "feature.finish"]
  push = true
EOF
    else
      log-warn "git flow already configured for $repo!"
    fi
  else
  	log-warn "git config file '$config_file' not found!"
  fi
}

clone-missing-repo() {
  repo="$1"

  if ! [ -d "$SRC_DIR/$repo" ]; then
    echo "cloning $repo repo..."
    git clone "git@github.com:daptiv/$repo.git" "$SRC_DIR/$repo"
  fi
}

strap-repo() {
  repo="$1"
  repo_dir="$SRC_DIR/$repo"

  if [ -f "$repo_dir/strap.sh" ]; then
  	echo "running strapfile..."
  	bash "$repo_dir/strap.sh"
  else
  	echo "strap file not found in $REPO repo!"
  fi
}

clone-with-options() {
  #repo should be last argument
  repo="${@: -1}"

  clone-missing-repo "$repo"

  while [ "$1" != '' ]; do
    case "$1" in
      --strap)
        strap-repo "$repo"
        ;;
      --git-flow)
        init-git-flow-for-repo "$repo"
        ;;
      *)
        #ignore unrecognized options
        ;;
    esac
    shift
  done
}


clone-and-strap-repo() {
  repo="$1"

  log-warn 'clone-and-strap-repo is deprecated, switch to: `clone-with-options --strap`'
  clone-with-options "$repo" --strap
}
