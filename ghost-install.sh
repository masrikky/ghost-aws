curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && apt upgrade -y
sudo apt install nginx -y
sudo apt install nodejs npm -y
sudo apt install gcc g++ make -y
sudo apt install yarn -y
sudo apt install mysql-server -y
sudo mkdir -p -v /var/www/rikkyghost
sudo chown $USER:$USER /var/www/rikkyghost
sudo chmod 775 /var/www/rikkyghost
npm install ghost-cli@latest -g