cd ~
sudo apt-get update
sudo apt-get install libsdl2{,-image,-mixer,-ttf,-gfx}-dev vim-gnome tree git mercurial subversion terminator build-essential
git config --global user.name "Steven Wilson"
git config --global user.email stevenwilson500@gmail.com
git config --global core.editor subl

git clone https://github.com/Steven-Wilson/dotfiles
cp dotfiles/.profile ~/.profile
cp dotfiles/.vimrc ~/.vimrc
cp dotfiles/.gvimrc ~/.vimrc

wget https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.5.1.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin:$HOME/bin
export GOPATH=$HOME/go

go get -v github.com/veandco/go-sdl2/sdl{,_mixer,_image,_ttf}
