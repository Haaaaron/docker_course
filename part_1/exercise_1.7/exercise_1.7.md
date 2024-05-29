We first build our docker image copying the script `./script.sh` which has the proper execution permissions based on the docker file `Dockerfile`

    docker build . -t curler

We notice it exists

```
$ docker image ls
REPOSITORY                          TAG       IMAGE ID     CREATED              SIZE        
curler                              latest    a8a5165804bc   About a minute ago   137MB
```

Then let's execute

```
$ docker run -it curler
Input website:                                                                                
helsinki.fi
Searching..
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx/1.22.1</center>
</body>
</html>
```