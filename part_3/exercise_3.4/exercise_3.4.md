Same as exercise 3.3 but with the added dockerfile so that the script is ran inside a docker container and the added docker login to the script

can be ran with 

```
docker run -e DOCKER_USER=$USER \
  -e DOCKER_ACCESS_TOKEN=$ACCESS_TOKEN \
  -v /var/run/docker.sock:/var/run/docker.sock \
  builder $USER/express_app $USER/testing
```