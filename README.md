Docker tips
=====

### Docker images/container commands

```
sudo docker images -a                                # Docker image listing (all)
sudo docker rmi -f image_name1 image_name2           # Deleting images with force
sudo docker ps -a                                    # Docker container listing (all)
sudo docker system prune -a                          # Purging all anused or dangling images, containers, volumes, and networks
sudo docker start container_id/name                  # Starting extited container
sudo docker stop container_id/name                   # Starting extited container
sudo docker exec -it container_id/name /bin/bash     # Execute a command in a running container
```

### Docker image building (based on Dockerfile)

```
sudo docker build --no-cache -t image_name:tag .     # Image building without cache
```

### Run container with host volume mounting

```
sudo docker run --name container_name -v host_directory:/container_directory -it image_name /bin/bash
docker run --isolation=hyperv -it image_name cmd.exe # Docker run in Windows env
```

### Helples links

* <https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes>
* <https://towardsdatascience.com/how-to-mount-a-directory-inside-a-docker-container-4cee379c298b>
