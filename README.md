dotvim
======

base `vim-pathogen` & `git submodule`

# INSTALL

```bash
$ cd ~

$ git clone git://github.com/leecade/dotvim.git .vim

$ cd ~/.vim

$ sh install.sh
```

# Add a bundle

```bash
$cd ~/.vim

$ git submodule add git://github.com/tpope/vim-markdown.git bundle/vim-markdown
```

# Remove a bundle

```bash
$ git rm bundle/vim-markdown
```

# Update bundle

```bash
$ cd ~/.vim

$ sh update.sh
```
# USAGE

* `,d` brings up [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
* `,t` brings up [ctrlp.vim](https://github.com/kien/ctrlp.vim), a project file filter for easily opening specific files
* `,b` restricts ctrlp.vim to open buffers
* `,a` starts project search with [ack.vim](https://github.com/mileszs/ack.vim) using [ag](https://github.com/ggreer/the_silver_searcher) (like ack)
* `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
* `\\\` toggles current line comment
* `\\` toggles visual selection comment lines
* `vii`/`vai` visually select *in* or *around* the cursor's indent
* `,[space]` strips trailing whitespace
* `^]` jump to definition using ctags
* `,l` begins aligning lines on a string, usually used as `,l=` to align assignments
* `^hjkl` move between windows, shorthand for `^w hjkl`

# CONTRIBUTE

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

