#! /bin/bash 

apt update && apt dist-upgrade -y

#installing some system utilities 
apt install brightnessctl pulseaudio pavucontrol git anypaper feh flameshot blueman polybar apt-transport-https  -y  

## adding the special repositoryies 
add-apt-repository ppa:neovim-ppa/unstable
add-apt-repository ppa:obsproject/obs-studio

######## i3 repository 
curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
apt install apt-transport-https --yes
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild-ubuntu/ all main" | tee /etc/apt/sources.list.d/i3-autobuild.list

######## code 
apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# get update
apt update 

# installing own softwares
apt install kitty neovim firefox gpaste dolphin kdeconnect fish psensor i3 gdebi ffmpeg obs-studio lxappearance wget vlc code -y 

# giving permission to brightnessctl 
chmod +s $(which brightnessctl)


# replacing old files 
rm -rf ~/.config ~/.bashrc

# creating symlinks 
ln -sf ~/dotfiles/.config ~/.config 
ln -sf ~/dotfiles/.bashrc ~/.bashrc 
ln -sf ~/dotfiles/i3status.conf ~/i3status.conf
