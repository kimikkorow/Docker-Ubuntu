echo "更新系统包"
apt update 
apt upgrade -y

echo "设置时区"
apt install -y tzdata
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo Asia/Shanghai >/etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

echo "安装依赖"
apt install sudo nano git wget curl python3 pip3 python-pip python-dev build-essential -y
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

echo "更换腾讯源"
echo "deb https://mirrors.cloud.tencent.com/ubuntu/ jammy main restricted universe multiverse
deb-src https://mirrors.cloud.tencent.com/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.cloud.tencent.com/ubuntu/ jammy-security main restricted universe multiverse
deb-src https://mirrors.cloud.tencent.com/ubuntu/ jammy-security main restricted universe multiverse
deb https://mirrors.cloud.tencent.com/ubuntu/ jammy-updates main restricted universe multiverse
deb-src https://mirrors.cloud.tencent.com/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.cloud.tencent.com/ubuntu/ jammy-proposed main restricted universe multiverse
deb-src https://mirrors.cloud.tencent.com/ubuntu/ jammy-proposed main restricted universe multiverse
deb https://mirrors.cloud.tencent.com/ubuntu/ jammy-backports main restricted universe multiverse
deb-src https://mirrors.cloud.tencent.com/ubuntu/ jammy-backports main restricted universe multiverse
"> /etc/apt/sources.list

