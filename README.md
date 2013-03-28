dotvim
======

base `vim-pathogen` & `git submodule`

# INSTALL

```bash
$cd ~
$git clone git://github.com/leecade/dotvim.git .vim
```

`mv ~/.vimrc{,.bak}`

`ln -s ~/.vim/vimrc ~/.vimrc`

`git submodule init`

`git submodule update`

# Add a bundle

`cd ~/.vim`

`git submodule add git://github.com/tpope/vim-markdown.git bundle/vim-markdown`

# Remove a bundle

`git rm bundle/vim-markdown`

# Update bundle
`cd ~/.vim`

`git submodule foreach git pull origin master`



