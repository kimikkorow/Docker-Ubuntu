echo "更新系统包"
apt update 
apt upgrade -y

echo "安装依赖"
apt install nginx -y

echo "允许防火墙"
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx Full'
sudo ufw allow 'Nginx HTTPS'

echo "设置自启动\输出状态"
sudo systemctl enable nginx
systemctl status nginx

echo "清理垃圾"
apt autoremove -y
apt autoclean -y

