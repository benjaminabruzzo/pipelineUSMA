#!/bin/bash

# rclone 
# n : new remote
# name : googledrive
# Storage : 11 (google drive)
# client_id : <leave blank>
# client_secret : <leave blank>
# scope : 1 (full access)
# root_folder_id : <leave blank>
# service_account_file : <leave blank>
# use auto config? : y (shoudl launch page in browser to request google account access)
# configure as team drive? : no
# is this config okay? : yes
# quit: q

cd ~/Downloads && sudo curl https://rclone.org/install.sh | sudo bash
rclone config