sudo apt-get install -y ruby-full
mkdir -p ~/ruby/ && cd ~/ruby
git clone https://github.com/jamiew/tumblr-photo-downloader
cd tumblr-photo-downloader

sudo gem install bundler
bundle install

bundle exec ruby tumblr-photo-downloader.rb jamiew.tumblr.com

By default, images will be saved in a sub-directory of the directory containing the script (eg tumblr-photo-downloader/jamiew.tumblr.com). If you want them to be saved to a different directory, you can pass its name as an optional second argument:

bundle exec ruby tumblr-photo-downloader.rb jamiew.tumblr.com ~/pictures/jamiew-tumblr-images/
