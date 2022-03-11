#! /bin/bash
curl -fsSL https://rpm.nodesource.com/setup_17.x | bash -
yum install -y nodejs
mkdir /opt/ReactApp/
wget https://github.com/GogHox/smart-bank-react/archive/refs/heads/main.zip 
unzip main.zip -d /opt/ReactApp/
cd /opt/ReactApp/smart-bank-react-main/
npm install
#sudo echo "export const API_URL = 'http://Saturn-ALB-API-1091840505.us-west-1.elb.amazonaws.com/'" > src/Constants.js
sudo echo "export const API_URL = 'http://saturn-alb-557774012.us-west-1.elb.amazonaws.com:3000/'" > src/Constants.js
#saturn-alb-557774012.us-west-1.elb.amazonaws.com
sudo npm run build
sudo npm install -g serve
sudo serve -s build -l 80
npm run start &