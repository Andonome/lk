cd /usr/share/X11/xkb/symbols/
cp pc pc.bak
echo "pc backup copied - this isn't tested" >> ~/install.log
sed s/Caps_Lock/Escape/ pc > pc
cd
echo "deb https://dl.bintray.com/hawkeye116477/waterfox-deb release main" | sudo tee -a /etc/apt/sources.list
curl https://bintray.com/user/downloadSubjectPublicKey?username=hawkeye116477 | sudo apt-key add -
sudo apt-get update && sudo apt-get install waterfox

```

echo "deb http://http.kali.org/ /kali main contrib non-free
deb http://http.kali.org/ /wheezy main contrib non-free
deb http://http.kali.org/kali kali-dev main contrib non-free
deb http://http.kali.org/kali kali-dev main/debian-installer
deb-src http://http.kali.org/kali kali-dev main contrib non-free
deb http://http.kali.org/kali kali main contrib non-free
deb http://http.kali.org/kali kali main/debian-installer
deb-src http://http.kali.org/kali kali main contrib non-free
deb http://security.kali.org/kali-security kali/updates main contrib non-free
deb-src http://security.kali.org/kali-security kali/updates main contrib non-free" >> /etc/apt/sources.list

```

setxkbmap gb

# gksudo firefox -install-global-extension addon-1865-latest.xpi
		#install addon with cli
apt-get -y install openvpn
cd /etc/openvpn


sudo wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip

unzip ovpn.zip

	rm ovpn.zip

sudo apt-get install openvpn network-manager-openvpn network-manager-openvpn-gnome

wget https://github.com/maestrogerardo/i3-gaps-deb/archive/master.zip

echo "if you don't have openvpn options in your gnome desktop, this just isn't going to work.  Get the openvpn manager, called 'openvpn-service-gnome' or some such" >> ~/*log
unzip ma*

rm ma*zip

cd i3-g*

sudo apt -y update;sudo apt -y upgrade

./i3*

cd

mv i3/ .config

sudo apt install feh compton ranger w3m cmus scrot

sudo apt install tor

wget https://github.com/dpayne/cli-visualizer/archive/master.zip

echo "If vis is playing funny-buggers, enter the install files and input the commands manually.  May be an architecture problem as I don't have arm cpu" >> *log

unzip master.zip

rm master.zip

cd cli-vis*

apt install libfftw3-dev libncursesw5-dev libpulse-dev

./install.sh

cd

mkdir Images;mkdir Images/Wallpapers;mkdir Images/Screenshots

apt install -y encfs cmatrix cowsay

mkdir Tools

cd Tools

wget https://github.com/Mebus/cupp/archive/master.zip

unzip master.zip;rm master.zip

cd
