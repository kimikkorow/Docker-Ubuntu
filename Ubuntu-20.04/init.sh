echo "更新系统包，修改时区"
apt update
apt upgrade -y
apt install -y tzdata
ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime
echo ${TZ} >/etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

echo "安装依赖"
apt install sudo -y
sudo apt install nano git wget curl -y

echo "清理垃圾"
apt autoremove -y
apt autoclean -y
rm -rf /var/lib/apt/lists/*

echo "使用北交大源"
echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirror.bjtu.edu.cn/ubuntu/ focal main restricted universe multiverse
# deb-src https://mirror.bjtu.edu.cn/ubuntu/ focal main restricted universe multiverse
deb https://mirror.bjtu.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
# deb-src https://mirror.bjtu.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirror.bjtu.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
# deb-src https://mirror.bjtu.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirror.bjtu.edu.cn/ubuntu/ focal-security main restricted universe multiverse
# deb-src https://mirror.bjtu.edu.cn/ubuntu/ focal-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirror.bjtu.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
# deb-src https://mirror.bjtu.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse" >/etc/apt/sources.list