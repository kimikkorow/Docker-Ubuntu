echo "更新系统包"
apt update 
apt upgrade -y

echo "安装依赖"
apt install python3 pip3 python-pip python-dev build-essential -y
sudo pip install --upgrade pip -y
sudo pip3 install --upgrade pip -y

echo "调整优先度"
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150

echo "pip换阿里源"
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/

echo "清理垃圾"
apt autoremove -y
apt autoclean -y

