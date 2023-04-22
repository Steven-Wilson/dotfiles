mkdir -p \
	~/.config/dunst \
	~/.config/fish \
    ~/.config/i3 \
    ~/.config/i3blocks \
	~/.config/nvim \
	~/.config/qtile \
	~/.config/qutebrowser \
	~/.config/rofi \
	~/.config/xfce4/terminal \

ln -sf ~/dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/.config/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/.config/i3blocks/config ~/.config/i3blocks/config
ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.config/picom.conf ~/.config/picom.conf
ln -sf ~/dotfiles/.config/qtile/config.py ~/.config/qtile/config.py
ln -sf ~/dotfiles/.config/qutebrowser/autoconfig.yml ~/.config/qutebrowser/autoconfig.yml
ln -sf ~/dotfiles/.config/qutebrowser/quickmarks ~/.config/qutebrowser/quickmarks
ln -sf ~/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sf ~/dotfiles/.config/rofi/one-dark.rasi ~/.config/rofi/one-dark.rasi
ln -sf ~/dotfiles/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.xonshrc ~/.xonshrc

