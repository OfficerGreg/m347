
# m347-project

docker compose consisting of config for wordpress with nginx, filebrowser and mediawiki






## Installation

To install this project make sure that docker is downloaded or download it through this link:

https://www.docker.com/products/docker-desktop/
    
  
## Deployment

To deploy this project run

```bash
  docker compose up
```

Do scale the wordpress container use, replace the *no.* with the number of container you want

```bash
  docker compose up --scale wordpress=*no.*
```


## Environment Variables

Additionally docker compose values can be adjusted through the **.env** file 



