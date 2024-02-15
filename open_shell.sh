#!bin/bash

docker ps | sed 1d | fzf --preview='docker container inspect {1}' | cut -d " " -f 1 | xargs -o -I id docker exec -it id sh