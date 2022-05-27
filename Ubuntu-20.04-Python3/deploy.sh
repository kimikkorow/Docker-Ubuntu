#!/bin/sh
imageName="ubuntu20.04:python3"

echo "清除原有内容"
docker stop $imageName
docker rm $imageName
docker rmi $imageName

echo "打包镜像"
docker build --network host -t $imageName .
