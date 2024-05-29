The solution was 

    $ docker run -v "$(pwd)/text.log:/usr/src/app/text.log" -it devopsdockeruh/simple-web-service

The result is in the file `./text.log`