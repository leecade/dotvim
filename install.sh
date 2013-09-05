git submodule init
for i in $(git submodule | sed -e 's/.* //'); do
    spath=$(git config -f .gitmodules --get submodule.$i.path)
    surl=$(git config -f .gitmodules --get submodule.$i.url)
    git clone --depth 1 $surl $spath
done
if [ -e ~/.vimrc ]; then
    echo "backup your .vimrc"
    mv ~/.vimrc{,.bak}
fi
ln -s ~/.vim/vimrc ~/.vimrc
