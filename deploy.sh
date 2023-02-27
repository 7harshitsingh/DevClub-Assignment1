#!/bin/bash
imageName=$1
root=$(pwd)

deployStaticDockerImage() {
	touch Dockerfile
	echo "FROM nginx:alpine" >> Dockerfile
	echo "COPY . /usr/share/nginx/html/" >> Dockerfile

	docker build -t $imageName .
	docker run -d -p 80:80 $imageName
}
deployStaticDockerImage
