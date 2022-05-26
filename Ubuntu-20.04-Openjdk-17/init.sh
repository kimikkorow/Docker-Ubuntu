echo "更新系统包"
apt update 
apt upgrade -y

echo "安装依赖"
apt install openjdk-17-jdk openjdk-17-jre -y

echo "清理垃圾"
apt autoremove -y
apt autoclean -y

