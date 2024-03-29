mkdir -p ~/.local/bin

ln -sf ~/dotfiles/.local/bin/2-monitor.sh ~/.local/bin/2-monitor.sh
ln -sf ~/dotfiles/.local/bin/3-monitor.sh ~/.local/bin/3-monitor.sh
ln -sf ~/dotfiles/.local/bin/elecom.sh ~/.local/bin/elecom.sh
ln -sf ~/dotfiles/.local/bin/EverQuest ~/.local/bin/EverQuest
ln -sf ~/dotfiles/.local/bin/random_quote ~/.local/bin/random_quote
ln -sf ~/dotfiles/.local/bin/startup.sh ~/.local/bin/startup.sh
ln -sf ~/dotfiles/.local/bin/tablet.sh ~/.local/bin/tablet.sh

mkdir -p \
    ~/.config/dunst \
    ~/.config/fish \
    ~/.config/herbstluftwm \
    ~/.config/i3 \
    ~/.config/i3blocks \
    ~/.config/nvim \
    ~/.config/qtile \
    ~/.config/qutebrowser \
    ~/.config/rofi \
    ~/.config/xfce4/terminal

ln -sf ~/dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/.config/herbstluftwm/autostart ~/.config/herbstluftwm/autostart
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

