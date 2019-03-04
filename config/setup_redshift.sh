sudo apt-get install -y redshift redshift-gtk

# To avoid printing data back to the console, redirect the output to /dev/null.
echo ' ' | sudo tee --append /etc/geoclue/geoclue.conf > /dev/null
echo "[redshift]" | sudo tee --append /etc/geoclue/geoclue.conf > /dev/null
echo "allowed=true" | sudo tee --append /etc/geoclue/geoclue.conf > /dev/null
echo "system=false" | sudo tee --append /etc/geoclue/geoclue.conf > /dev/null
echo "users=" | sudo tee --append /etc/geoclue/geoclue.conf > /dev/null

cp ~/pipeline16044/settings/redshift.conf ~/.config/ 

# create an autostart application: windows->search for startup
# name: autostart-redshift
# command: gtk-redshift -l geoclue2 -t 6500:5500 -b 1.0:0.55
# comment: autostart redshift



