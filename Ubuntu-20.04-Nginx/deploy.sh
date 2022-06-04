#!/bin/sh
imageName="ubuntu:nginx"

echo "清除原有内容"
docker stop $imageName
docker rm $imageName
docker rmi $imageName

echo "打包镜像"
docker build --network host -t $imageName .
