## Download cygwin 32bit or 64 from the internet (setup.exe)
## If it will be on a pc without internet access, run setup.exe on a different computer to download all of the libraries
## make sure to check openssh, krb5, and rsync libs

## Install


###########################################
#  After it has been installed, modify the cygwin batch file by adding this lin:
# set CYGWIN=binmode ntsec
# in <cygwin_root>\cygwin.bat:

#####  \/\/\/\/\/\/\/\/\/ #############
@echo off

C:
chdir C:\cygwin64\bin
set CYGWIN=binmode ntsec

bash --login -i

#####  /\/\/\/\/\/\/\/\/\ #############


###########################################
# Set up SSH:
# right click cygwin from the start menu and " run as administrator" for cygwin terminal

$ ssh-host-config

# basically agree to everything
*** Query: Should privilege separation be used? : yes
*** Query: New local account 'sshd'? : yes
*** Query: Do you want to install sshd as a service?
*** Query: : yes
*** Query: Enter the value of CYGWIN for the deamon: [] binmode ntsec
"Do you want to use a different name?" (yes/no) no

# if asked, especially make sure that both of these are set to yes:
StrictModes
PubkeyAuthentication

# once finished, the service can be started

######
ssh-keygen -t ras. #this did not work on e6510

## start the sshd service:
cygrunsrv -S sshd


### To test:
on other terminal, try ssh -l benjamin 192.168.x.x 'date'


# need to open port 22 on windows network
start 
type "windows firewall with advanced security"





####
nuke the sshd service
# Remove sshd service
cygrunsrv --stop sshd
cygrunsrv --remove sshd

# Delete any sshd or related users (such as cyg_server) from /etc/passwd
#   (use your favorite editor)

# Delete any sshd or related users (such as cyg_server) from the system
net user sshd /delete
net user cyg_server /delete


##


I know this thread is quite old but I stumbled up this because I had a similar issue with no solution to be found. What bdoughty1970 said was absolutely spot on.

You have to make sure that you add the client public key to server authorized_keys
client: id_rsa.pub
server_user: ~/.ssh/authorized_keys

# if you scp the client public key to server user, then copy the contents into the authorized keys (after logging into the server as the user)
  scp ~/.ssh/jupiter.pub tbrl@192.168.100.25:~/
  scp ~/etc/id_rsa.pub benjamin@jupiter.local:~/
  scp ~/.ssh/id_rsa.pub benjamin@jupiter.local:~/
  scp ~/.ssh/id_rsa.pub turtlebot@kobuki.local:~/
  cat id_rsa.pub >> ~/.ssh/authorized_keys
  rm id_rsa.pub
