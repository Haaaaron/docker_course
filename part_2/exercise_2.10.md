The result of the port scan was

```
$ docker run -it --rm --network host networkstatic/nmap localhost
Unable to find image 'networkstatic/nmap:latest' locally
latest: Pulling from networkstatic/nmap
213ec9aee27d: Pull complete 
c7286bfc71dc: Pull complete 
Digest: sha256:a4a64067a87bcd32d3814f65218e4a5bd97e7eb617788c1aea4c086b1ad405a3
Status: Downloaded newer image for networkstatic/nmap:latest
Starting Nmap 7.92 ( https://nmap.org ) at 2024-05-30 21:00 UTC
Nmap scan report for localhost (127.0.0.1)
Host is up (0.0000090s latency).
Not shown: 999 closed tcp ports (reset)
PORT    STATE SERVICE
631/tcp open  ipp

Nmap done: 1 IP address (1 host up) scanned in 0.23 seconds
```