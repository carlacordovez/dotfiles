Used for dev setup in conjunction with daptiv/strap.

What it does
------------

- replaces `~/.bash_profile` with link to this [.bash_profile](.bash_profile)
- replaces `~/.bashrc` with link to this [.bashrc](.bashrc)
- replaces `~/.npmrc` with link to this [.npmrc](.npmrc)
- creates a link at `~/.Daptiv.Brewfile` to this [.Daptiv.Brewfile](.Daptiv.Brewfile)

To install a project, run ```bash projects/setup {project name}```
To re-install/update a project, run ```bash projects/setup -f {project name}```