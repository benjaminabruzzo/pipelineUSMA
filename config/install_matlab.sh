####### Matlab
# Download and unpack the archive
cd ~/Downloads/matlab* && sudo sh install
# if needed:

# # create launcher icon
# sudo wget http://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png -O /usr/share/icons/matlab.png
# sudo touch /usr/share/applications/matlab.desktop
# sudo echo '#!/usr/bin/env xdg-open' >> /usr/share/applications/matlab.desktop
# sudo echo '[Desktop Entry]' >> /usr/share/applications/matlab.desktop
# sudo echo 'Type=Application' >> /usr/share/applications/matlab.desktop
# sudo echo 'Icon=/usr/share/icons/matlab.png' >> /usr/share/applications/matlab.desktop
# sudo echo 'Name=MATLAB R2018a' >> /usr/share/applications/matlab.desktop
# sudo echo 'Comment=Start MATLAB - The Language of Technical Computing' >> /usr/share/applications/matlab.desktop
# sudo echo 'Exec=matlab -desktop' >> /usr/share/applications/matlab.desktop
# sudo echo 'Categories=Development;' >> /usr/share/applications/matlab.desktop

####### Matlab
# create launcher icon
sudo wget http://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png -O /usr/share/icons/matlab.png
touch ~/.local/share/applications/matlab.desktop
echo '#!/usr/bin/env xdg-open' >> ~/.local/share/applications/matlab.desktop
echo '[Desktop Entry]' >> ~/.local/share/applications/matlab.desktop
echo 'Type=Application' >> ~/.local/share/applications/matlab.desktop
echo 'Icon=/usr/share/icons/matlab.png' >> ~/.local/share/applications/matlab.desktop
echo 'Name=MATLAB R2018a' >> ~/.local/share/applications/matlab.desktop
echo 'Comment=Start MATLAB - The Language of Technical Computing' >> ~/.local/share/applications/matlab.desktop
echo 'Exec=matlab -desktop' >> ~/.local/share/applications/matlab.desktop
echo 'Categories=Development;' >> ~/.local/share/applications/matlab.desktop

mkdir -p ~/matlab/exp-scripts && cd ~/matlab/exp-scripts
git init && git remote add bb git@bitbucket.org:ags_robotics/matlab-exp-scripts.git && git pull bb master

mkdir -p ~/matlab/utilities && cd ~/matlab/utilities
git init && git remote add bb git@bitbucket.org:ags_robotics/matlab-utilities.git && git pull bb master

mkdir -p ~/Documents/MATLAB && touch /home/benjamin/Documents/MATLAB/startup.m
echo "cd('~/matlab/utilities/');" >> /home/benjamin/Documents/MATLAB/startup.m
echo "startup_1604" >> /home/benjamin/Documents/MATLAB/startup.m

cd ~/pipelineUSMA/