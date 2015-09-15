cd ~

sudo pacman -Syu
sudo pacman -S gvim git mercurial subversion tree sdl2{,_image,_mixer,_ttf,_net,_gfx} terminator
git clone github.com/Steven-Wilson/dotfiles
git clone https://github.com/Steven-Wilson/dotfiles
cp dotfiles/.profile ~/.profile
cp dotfiles/.vimrc ~/.vimrc
cp dotfiles/.gvimrc ~/.gvimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git config --global user.name "Steven Wilson"
git config --global user.email stevenwilson500@gmail.com
git config --global core.editor vim
wget https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.5.1.linux-amd64.tar.gz
