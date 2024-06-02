#!/bin/bash

docker stop xsll-attacker xsll-victim

docker run -it --rm -d -p 31415:80 --name xsll-attacker -v $(pwd)/attacker:/usr/share/nginx/html nginx
docker run -it --rm -d -p 27182:80 --name xsll-victim -v $(pwd)/victim:/usr/share/nginx/html nginx
