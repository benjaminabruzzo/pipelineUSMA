# bash ~/pipeline16044/config/install_blender.sh

touch ~/.local/share/applications/blender.desktop
echo '#!/usr/bin/env xdg-open' >> ~/.local/share/applications/blender.desktop
echo '[Desktop Entry]' >> ~/.local/share/applications/blender.desktop
echo 'Name=Blender' >> ~/.local/share/applications/blender.desktop
echo 'GenericName=3D modeler' >> ~/.local/share/applications/blender.desktop
echo 'Exec=/usr/lib/blender/blender' >> ~/.local/share/applications/blender.desktop
echo 'Icon=/usr/lib/blender/blender.svg' >> ~/.local/share/applications/blender.desktop
echo 'Terminal=false' >> ~/.local/share/applications/blender.desktop
echo 'Type=Application' >> ~/.local/share/applications/blender.desktop
echo 'Categories=Graphics;3DGraphics;' >> ~/.local/share/applications/blender.desktop
echo 'MimeType=application/x-blender;' >> ~/.local/share/applications/blender.desktop

sudo mkdir -p /usr/lib/blender && cd ~/Downloads/blender* && sudo cp ./ /usr/lib/blender -r
sudo apt-get update && sudo apt-get install -y freecad inkscape gdal-bin libgdal-dev python-gdal



