sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p \
    ~/.config/dunst \
    ~/.config/fish \
    ~/.config/nvim \
    ~/.config/rofi \
    ~/.config/xfce4/terminal \
    ~/.config/sxhkd \
    ~/.config/i3blocks \
    ~/.config/i3 

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf ~/dotfiles/.config/fish/fish.config ~/.config/fish/fish.config
ln -sf ~/dotfiles/.config/fish/fish_variables ~/.config/fish/fish_variables
ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sf ~/dotfiles/.config/rofi/one-dark.rasi ~/.config/rofi/one-dark.rasi
ln -sf ~/dotfiles/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc
ln -sf ~/dotfiles/.config/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/.config/i3blocks/config ~/.config/i3blocks/config
ln -sf ~/dotfiles/.config/picom.conf ~/.config/picom.conf
ln -sf ~/dotfiles/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

