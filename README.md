# Amazon Web Service - Ghost
---
This is guide to install **Ghost (free and open source blogging platform)** on AWS EC2 Instance with Nginx. This guide similar to official documentation, so you can check and compare.
I launch my EC2 Instance on **ap-southeast-3 region (Jakarta)**.

If you install on another VPS provider, this step is also similar (most VPS provider doesn't require to set security groups).

### Prerequisite
---
1. Ubuntu 20.04 LTS
2. Nodejs (v14)
3. NPM (Node Package Manager)
4. MySQL
5. Ghost CLI (installed using NPM)
6. Other dependencies

### Step by step
---
1. Configure your instance.
2. Configure security groups (open typical port for web server : 80 and 443)
3. Launch and enter your instance using SSH
4. Get Nodejs v14
	> `curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash`
5. Install yarn (optional)
	> `curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null`
	> `echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list`
6. Update and upgrade instance
	> `sudo apt update && apt upgrade`
7. Install NGINX
	> `sudo apt install nginx`
8. Check if NGINX was properly configured and allowed by firewall
	> `sudo ufw app list`
	> `sudo ufw status`
9. Install Nodejs, NPM, Yarn and other dependecies
	> `sudo apt install nodejs npm yarn gcc g++ make`
10. Install MySQL
	> `sudo apt install mysql-server`
11. Configure MySQL
	> - Enter mysql : `mysql`
	> - Change root password : `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Ci3St4lk1ng';`
	> Feel free to change **Ci3St4lk1ng** with your loved password.
12. Install **ghost-cli globally** using npm
	> `npm install ghost-cli@latest -g` 
13. Create ghost installation directory (we're not overwrite existing one)
	> - Create new dir for ghost : `sudo mkdir -p -v /var/www/rikkyghost` . Change **rikkyghost** with your prefered name
	> - Assign current user to ghost folder : `sudo chown $USER:$USER /var/www/rikkyghost`
	> - Change ghost directory permission : `sudo chmod 775 /var/www/rikkyghost`
	> - Check if everything is created properly : `ls -l /var/www/` 
14. Change your working directory to Ghost
	> `cd /var/www/rikkyghost` 
15. Install Ghost (it will take sometime)
	> `ghost install`
16. Configure Ghost (you'll be asked some information after **ghost install** finish build)
	> - Enter your blog url (in this case i don't want to point my domain, so i type my EC2 IP Address instead of my domain) : example.com
	> - Enter your MySQL Host : **localhost**
	> - Enter your MySQL Username : **root**
	> - Enter your MySQL Password (remember when we set up password above) : **Ci3St4lk1ng**
	> - Enter your Ghost database name (i leave it as default, just press enter) : **rikkyghost_prod**
	> - Do you wish to set up "ghost" mysql user? **Yes**
	> - Do you wish to set up Nginx? **Yes**
	> - Do you wish to set up Systemd? **Yes**
	> - Do you want to start Ghost? **Yes**
17. After finish you need to setup Admin account, your setup url might look like : https://example.com/ghost. Just open your browser, and create new Admin account.
18. Login to Ghost dashboard, you can create new post or design your site here.
19. Finish.


### Easy way
---
I create shell script to install prerequisite dependencies.

1. Clone this repo or download ghost-install.sh
2. Run by `sudo bash ghost-install.sh`
3. Change some configuration (like ghost directory name) 
4. Setup MySQL
5. Install Ghost, done.