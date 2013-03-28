dotvim
======

base `vim-pathogen` & `git submodule`

# INSTALL

```bash
$cd ~

$git clone git://github.com/leecade/dotvim.git .vim

$mv ~/.vimrc{,.bak}

$ln -s ~/.vim/vimrc ~/.vimrc

$cd ~/.vim

$git submodule init

$git submodule update
```

# Add a bundle

```bash
$cd ~/.vim

$git submodule add git://github.com/tpope/vim-markdown.git bundle/vim-markdown
```

# Remove a bundle

```bash
$git rm bundle/vim-markdown
```

# Update bundle

```bash
$cd ~/.vim

$git submodule foreach git pull origin master
```



