#!/usr/bin/env bash

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

clone-and-strap-repo() {
  repo="$1"

  clone-missing-repo "$repo"
  strap-repo "$repo"
}
