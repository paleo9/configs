# create vim directories for history, undo and swap
mkdir ~/.vim/{swapfiles,backupdir,undodir}

# create links to the github clone
# set $GITHUBLOCAL to the path of your cloning directory
ln -s $GITHUBLOCAL/paleo9/configs/i3/config ~/.configs/i3/config
ln -s $GITHUBLOCAL/paleo9/configs/vim/vimrc ~/.vimrc
ln -s $GITHUBLOCAL/paleo9/configs/UltiSnips ~/.vim/UltiSnips
ln -s $GITHUBLOCAL/paleo9/configs/bash/bashrc ~/.bashrc
