
# get ruby and rvm
sudo apt update -y
sudo apt install -y curl g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev
gpg --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
rvm get stable --auto-dotfiles
rvm install ruby-3.1.0
rvm --default use ruby-3.1.0

# clone exercism.org dev env
git clone https://github.com/exercism/development-environment.git

cd development-environment
cp stack.default.yml stack.yml

# patch hosts files
echo '127.0.0.1 local.exercism.io' | sudo tee -a /etc/hosts
./bin/start

# docker-compose stop
# docker-compose down
