#/bin/sh
echo '--- Update and install'
username=$SUDO_USER
userhome=$(getent passwd $SUDO_USER | cut -d: -f6)
sudo apt-get install -y xserver-xorg slim i3
sudo apt-get install -y vim-gtk unzip zip rxvt-unicode-256color xclip feh x11-xserver-utils pulseaudio
sudo apt-get install -y fonts-inconsolata xfonts-terminus xfonts-terminus-oblique
sudo apt-get install -y firefox

echo '--- Update Upgrade'
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get autoremove -y

echo '--- configure autorun'
echo 'setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ru,ua' > "${userhome}/.xsession"
echo 'feh --bg-scale background/i3wm.png' >> "${userhome}/.xsession"
echo 'exec i3' >> "${userhome}/.xsession"

echo '--- copy required configuration files into user home directory'
mkdir "${userhome}/.i3"
cp /vagrant/.i3/config "${userhome}/.i3/config"
cp /vagrant/.i3status.conf "${userhome}/.i3status.conf"
cp /vagrant/.Xresources  "${userhome}/.Xresources"
cp -r /vagrant/background/ "${userhome}/background/"
chown -R ${username}:${username} "${userhome}/.xsession" "${userhome}/.i3/" "${userhome}/.i3status.conf" "${userhome}/.Xresources" "${userhome}/background/"


echo '--- put this tasty command prompt into .bashrc'
#PS1='\[\033[01;30m\]\t \[\e[0;36m\]\u\[\e[m\]@\[\033[00;32m\]\h\[\033[00;37m\]:\[\033[31m\]$(__git_ps1 "(%s)\[\033[01m\]")\[\033[0;34m\]\w\[\033[00m\] $ '
echo 'fs.inotify.max_user_watches=16384' >> /etc/sysctl.conf
