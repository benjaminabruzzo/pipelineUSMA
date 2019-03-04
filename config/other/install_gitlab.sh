sudo apt-get update && sudo apt-get install -y curl openssh-server ca-certificates

#to send emails
sudo apt-get install -y postfix

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash


# Next, install the GitLab package. Change `http://gitlab.example.com` to the URL at which you want to access your GitLab instance. Installation will automatically configure and start GitLab at that URL. HTTPS requires additional configuration after installation.

sudo EXTERNAL_URL="http://gitlab.gnome1604" apt-get install gitlab-ee