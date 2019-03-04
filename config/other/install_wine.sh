
# from wineHQ.org
sudo dpkg --add-architecture i386 
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key && sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
sudo apt-get update && sudo apt-get install -y --install-recommends winehq-staging

winecfg


cd "${HOME}/Downloads" && wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks

cd ~ && wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
sudo winetricks --self-update
sh winetricks corefonts vcrun6 ie8



sudo apt-get install -y libcanberra-gtk-module:i386 winbind

cd ~/Downloads/ && wine Battle.net-Setup.exe 



# remove

rm -rf $HOME/.wine && rm -f $HOME/.config/menus/applications-merged/wine* && rm -rf $HOME/.local/share/applications/wine
rm -f $HOME/.local/share/desktop-directories/wine* && rm -f $HOME/.local/share/icons/????_*.xpm && sudo apt-get remove --purge wine
sudo apt-get update && sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove