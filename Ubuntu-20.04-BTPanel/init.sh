echo "更新系统包"
apt update 
apt upgrade -y

echo "安装宝塔面板"
if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec

echo "清理垃圾"
apt autoremove -y
apt autoclean -y

