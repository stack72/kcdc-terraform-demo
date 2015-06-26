#!/bin/sh
set -e -x
sudo apt-get install wget
wget "https://www.dropbox.com/s/myg0bi3j7j8eyt1/simpledemo_1.0.0_amd64.deb"
sudo dpkg -i simpledemo_1.0.0_amd64.deb
sudo apt-get install ruby
sudo gem install pleaserun
sudo pleaserun --install -p upstart -v 1.5 --name simpledemo /usr/bin/simpledemod
sudo service simpledemo start
