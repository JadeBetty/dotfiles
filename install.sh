#!/bin/bash

echo "Warning: This script will install and edit your KDE Plasma"
read -p "Do you want to proceed? <y/n>" yn

case $yn in
    y ) echo "Proceeding with reboot";;
    n ) echo "Exiting"; exit;;
    * ) echo "Invalid response, exiting rebooting"; exit 1;;
esac

echo 
echo "Updating package manager"
echo

cd $HOME

sudo apt update && sudo apt upgrade -y

echo "Finished updating and upgrading package manager"

echo "Installing required packages";

pkgs=(
    'git'
    'curl'
    'openssh'
)

for pkg in "${pkgs[@]}"; do
    echo "installing ${pkg}"
    sudo apt install -y "${pkg}"
done

echo "Finished installing required packages";

echo "Installing development environment"

echo "Installing IDE and NodeJS"
sudo apt install -y nvim
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo "Finished installing IDEs and NodeJS"

echo "Installing Neofetch for system information"
sudo apt install -y neofetch
echo "Finished installing Neofetch for system information"

echo "Backing up configs to $HOME/.config_backup"
cd $HOME
mv $HOME/.config $HOME/.config_backup && echo "Backup completed"
cp -r $HOME/dotfiles/.config $HOME/.config
cp -r $HOME/dotfiles/.icons $HOME/.icons
cp -r $HOME/dotfiles/.local $HOME/.local

echo "Finished updating .config"
echo "Please reboot your computer."
read -p "Do you want to restart your computer? <y/n>" yn

case $yn in
    y ) echo "Proceeding with reboot";;
    n ) echo "Exiting"; exit;;
    * ) echo "Invalid response, exiting rebooting"; exit 1;;
esac

echo "Rebooting in 10 seconds. Press Ctrl+C to cancel."
sleep 10s
sudo reboot
