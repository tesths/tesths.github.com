sudo apt-get update

sudo apt-get -y install libmysqlclient-dev

sudo locale-gen en_US.UTF-8

export LANG=en_US.UTF-8

export LANGUAGE=en_US.UTF-8

git clone https://github.com/cantino/huginn.git code-huginn

cd code-huginn

cp .env.example .env

gem install heroku

gem install bundler

bundle
