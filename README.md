#Installation commands

mv .vimrc ~/.vim/vimrc
mv .gvimrc ~/.vim/gvimrc


ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

############ Updating #######################
git add vimrc
git commit -m 'Changed vim colorscheme!'
git push origin master
Test;
