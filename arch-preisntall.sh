# Update packages list, upgrade system, and enable SSH
sudo pacman -Syy
sudo pacman -Syu
sudo pacman -S openssh
sudo systemctl enable --now sshd

