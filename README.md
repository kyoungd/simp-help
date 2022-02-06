# How to run and host Flask in a Docker Container 
https://www.youtube.com/watch?v=9tErxxGpOM4

# Build a docker image:
docker build -t simp-help .

# Create and run Docker container
docker run -d -p [host port]:[container port] [docker image] 
docker run -d -p 5000:5000 simp-help 

# stop docker
docker stop [processId]

#  How to see all images
docker images

# How to see all containers
docker ps
