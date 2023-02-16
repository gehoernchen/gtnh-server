# gtnh-server
This repository offers a Docker container to be used with Gregtech: New Horizons. You may use it to start up a Minecraft server using Docker.

You may find more information about the modpack [on CurseForge](https://www.technicpack.net/modpack/mcnewhorizons.677387).

## Using this image

To use this image manually, do the following inside the repository directory:

```
docker build -t max9076/gtnh:latest --build-arg modpackurl=[serverpack URL].
docker run <image_name> --name GTNH -p 25565:25565 
```

You can get the serverpack URL from http://downloads.gtnewhorizons.com/ServerPacks/.

### Docker Compose

Docker Compose is recommended. Use this image like this:

```
version: "3.8"
  services:
    gtnh:
      build:
        context: gtnh-server
        dockerfile: Dockerfile
        args:
          modpackurl: http://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.2.3_SERVER.zip
      container_name: gtnh-server
      ports:
        - 25565:25565
      volumes:
        - gtnh-world:/data/World
        - gtnh-config:/data/config
      tty: true
      stdin_open: true
      restart: unless-stopped
```