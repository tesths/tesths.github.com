sudo apt-get update

sudo apt-get -y install libmysqlclient-dev

echo "Install RVM"
echo "---------------------------------------------------------------------------"

apt-get -y install nodejs

command gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
command curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh

rvm install 2.3.3
rvm use 2.3.3 --default
rvm -v
ruby -v

sudo locale-gen en_US.UTF-8

export LANG=en_US.UTF-8

export LANGUAGE=en_US.UTF-8

git clone https://github.com/cantino/huginn.git code-huginn

cd code-huginn

cp .env.example .env

gem install bundler heroku

bundle
