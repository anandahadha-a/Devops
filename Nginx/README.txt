Build docker image:
docker build -t <image-name> .

Run docker container:
docker run --name <container-name> -p 10080:80 -p 10443:443 -d --restart always <image-name> 

Nginx server can be reached from this URl:port.
http://<docker-host-ip>:10080
https://<docker-host-ip>:10443

