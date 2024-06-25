Docker tips
=====

### Docker images/container commands

```
docker images -a                                # Docker image listing (all)
docker rmi -f image_name1 image_name2           # Deleting images with force
docker ps -a                                    # Docker container listing (all)
docker system prune -a                          # Purging all anused or dangling images, containers, volumes, and networks
docker start container_id/name                  # Starting container
docker stop container_id/name                   # Stoping container
docker exec -it container_id/name /bin/bash     # Execute a running container
```

### Docker image building (based on Dockerfile)

```
docker build --no-cache -t image_name:tag .     # Image building without cache
```

### Run container in Docker and Windows environment

```
docker run --name container_name -v host_directory:/container_directory -it image_name /bin/bash  # Run a container with host volume mounting
docker run --isolation=hyperv --name container_name -it image_name cmd.exe                        # Run a container in a Windows environment.
```

### Helples links

* <https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes>
* <https://towardsdatascience.com/how-to-mount-a-directory-inside-a-docker-container-4cee379c298b>
