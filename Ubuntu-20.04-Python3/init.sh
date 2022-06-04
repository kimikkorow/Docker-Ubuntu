echo "更新系统包"
apt update 
apt upgrade -y

echo "设置时区"
apt install -y tzdata 
ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime 
echo ${TZ} > /etc/timezone 
dpkg-reconfigure --frontend noninteractive tzdata

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

echo "更换阿里源"
echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
"> /etc/apt/sources.list

