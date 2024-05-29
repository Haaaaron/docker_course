It seems that the alpine image is significantly smaller than the ubuntu version

```
$ docker image ls
REPOSITORY                          TAG       IMAGE ID       CREATED       SIZE
ubuntu                              latest    bf3dc08bfed0   4 weeks ago   76.2MB
devopsdockeruh/simple-web-service   ubuntu    4e3362e907d5   3 years ago   83MB
devopsdockeruh/simple-web-service   alpine    fd312adc88e0   3 years ago   15.7MB
```

We started the alpine container with

```
$ docker run --name secret -it devopsdockeruh/simple-we
b-service:alpine
Starting log output
Wrote text to /usr/src/app/text.log
Wrote text to /usr/src/app/text.log
Wrote text to /usr/src/app/text.log
```

Then in a separate shell inspected the container 

```
$ docker exec -it secret sh
/usr/src/app # ls
server    text.log
/usr/src/app # tail -f text.log 
2024-05-29 11:04:12 +0000 UTC
2024-05-29 11:04:14 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2024-05-29 11:04:16 +0000 UTC
2024-05-29 11:04:18 +0000 UTC
2024-05-29 11:04:20 +0000 UTC
2024-05-29 11:04:22 +0000 UTC
2024-05-29 11:04:24 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
```

Seems like the functionality is the same