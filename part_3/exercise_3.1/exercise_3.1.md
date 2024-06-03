Created deploy.yml in root of the github repo

    /.github/workflows/deploy.yml

The github folder where the docker-compose with watchtower is located at:

    https://github.com/Haaaaron/docker_course/tree/main/part_3/exercise_3.1

Additionally the link to the docker hub link is:

    https://hub.docker.com/repository/docker/haaaaron/app-test/general

When running 

    docker compose up -d 
    
in the exercise_3.1 folder then we launch the web service at port 8080 for which when changes are pushed to the github repo the service also get's updated