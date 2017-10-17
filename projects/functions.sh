#!/usr/bin/env bash

clone-missing-repo() {
  repo="$1"

  if ! [ -d "$SRC_DIR/$repo" ]; then
    echo "cloning $repo repo..."
    git clone "git@github.com:daptiv/$repo.git" "$SRC_DIR/$repo"
  fi
}