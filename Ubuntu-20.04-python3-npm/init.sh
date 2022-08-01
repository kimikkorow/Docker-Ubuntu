echo "更新系统包，修改时区"
apt update
apt upgrade -y
apt install -y tzdata
ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime
echo ${TZ} >/etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata
rm -rf /var/lib/apt/lists/*

echo "安装依赖"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# 设置node v14.x软件源
apt update
apt install sudo -y
sudo apt install nano git wget curl python3 npm -y

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
deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
" >/etc/apt/sources.list