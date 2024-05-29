```
:docker_course$ docker run -d --name curl ubuntu sh -c 'apt-get update && apt-get install -y curl && tail -f /dev/null' 
7d1e8c6dd1fd2de83106af71f5f44dc1c7e583f702ef03550e541244b25234b7

:docker_course$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED              STATUS              PORTS     NAMES
94d0c73b69f4   ubuntu    "sh -c 'apt-get upda…"   About a minute ago   Up About a minute             curl

:docker_course$ docker exec -it curl bash
root@94d0c73b69f4:/# curl
curl: try 'curl --help' or 'curl --manual' for more information
root@94d0c73b69f4:/# while true; do echo 'Input website:'; read website; echo 'Searching..'; sleep 1; curl http://$website; done
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