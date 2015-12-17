!#/bin/sh



sudo add-apt-repository ppa:ondrej/php5-5.6 -y
sudo apt-get update
sudo apt-get install -y unzip php5-fpm php5-gd

sudo sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
sudo sed -i 's/user = www-data/user = vagrant/g' /etc/php5/fpm/pool.d/www.conf
sudo sed -i 's/group = www-data/group = vagrant/g' /etc/php5/fpm/pool.d/www.conf

sudo service php5-fpm restart
ulimit -n 4096

sudo wget http://download.getkirby.com/ -O kirby.zip
sudo unzip kirby.zip
sudo mkdir /vagrant/kirby
sudo mv -v kirby-*/* /vagrant/kirby/

sudo chown -R vagrant:vagrant /vagrant

sudo wget https://github.com/mholt/caddy/releases/download/v0.8.0/caddy_linux_amd64.tar.gz
sudo mkdir caddy
sudo tar -xvzf caddy_linux_amd64.tar.gz -C caddy

sudo ./caddy/caddy -conf="/vagrant/vagrant/caddylokal.conf" &



