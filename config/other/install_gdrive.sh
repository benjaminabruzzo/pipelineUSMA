# ~~~~~~~~~~~~~~~~~~~ install GO and gdrive
cd ~/Downloads && sudo curl -O https://storage.googleapis.com/golang/go1.10.3.linux-amd64.tar.gz
cd ~/Downloads && sudo curl https://rclone.org/install.sh | sudo bash
# sha256sum go*
# fa1b0e45d3b647c252f51f5e1204aba049cde4af177ef9f2181f43004f901035
tar xvf go*
sudo chown -R root:root ./go
sudo mv go /usr/local

mkdir ~/go


echo ' ' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.bashrc



export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
go get github.com/prasmussen/gdrive

gdrive about


# ~~~~~~~~~~~~~~~~ Testing installation
# mkdir -p ~/go/src/github.com/user/hello
# touch ~/go/src/github.com/user/hello/hello.go

# # Inside your editor, paste the code below, which uses the main Go packages, imports the formatted IO content component, and sets a new function to print "Hello, World" when run.
# \/\/\/\/\/\/\/\/

# package main

# import "fmt"

# func main() {
#     fmt.Printf("hello, world\n")
# }

# /\/\/\/\/\/\/\/\/\

# go install github.com/user/hello


# rclone 
# n : new remote
# name : remote
# Storage : 11 (google drive)
# client_id : <leave blank>
# client_secret : <leave blank>
# scope : 1 (full access)
# root_folder_id : <leave blank>
# service_account_file : <leave blank>
# use auto config? : y (shoudl launch page in browser to request google account access)
# configure as team drive? : no
# is this config okay? : yes