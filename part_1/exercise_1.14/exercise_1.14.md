I modified the docker files in folders

    ../exercise_1.12
    ../exercise_1.13

Then rebuilt the images:

    ../exercise_1.13/docker build . -t example-backend
    ../exercise_1.13/docker build . -t example-frontend
    
Then launched in separate terminals 
    
    docker run -p 127.0.0.1:8080:8080  example-backend
    docker run -p 127.0.0.1:3456:3456 example-frontend 

Then each respective terminals gave the responses

```
 INFO  Accepting connections at http://localhost:3456
 HTTP  5/30/2024 7:44:57 AM 172.17.0.1 GET /
 HTTP  5/30/2024 7:44:57 AM 172.17.0.1 Returned 304 in 128 ms
 HTTP  5/30/2024 7:44:58 AM 172.17.0.1 GET /static/css/main.eaa5d75e.chunk.css
 HTTP  5/30/2024 7:44:58 AM 172.17.0.1 GET /static/js/2.43ca3586.chunk.js
 HTTP  5/30/2024 7:44:58 AM 172.17.0.1 GET /static/js/main.2805156b.chunk.js
 HTTP  5/30/2024 7:44:58 AM 172.17.0.1 Returned 304 in 15 ms
 HTTP  5/30/2024 7:44:58 AM 172.17.0.1 Returned 304 in 6 ms
 HTTP  5/30/2024 7:44:58 AM 172.17.0.1 Returned 304 in 13 ms
 HTTP  5/30/2024 7:44:58 AM 172.17.0.1 GET /static/media/toskalogo.c0f35cf0.svg
 HTTP  5/30/2024 7:44:58 AM 172.17.0.1 Returned 200 in 17 ms

```

```
[Ex 2.4+] REDIS_HOST env was not passed so redis connection is not initialized
[Ex 2.6+] POSTGRES_HOST env was not passed so postgres connection is not initialized
[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /ping                     --> server/router.pingpong (4 handlers)
[GIN-debug] GET    /messages                 --> server/controller.GetMessages (4 handlers)
[GIN-debug] POST   /messages                 --> server/controller.CreateMessage (4 handlers)
[GIN-debug] Listening and serving HTTP on :8080
[GIN] 2024/05/30 - 07:44:59 | 200 |     101.152µs |      172.17.0.1 | GET      "/ping"
```