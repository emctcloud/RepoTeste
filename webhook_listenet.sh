#!/bin/bash
while true; do
  # Listen on port 9000 for incoming webhooks
  #socat TCP4-LISTEN:9000,fork EXEC:./update_docker.sh,pty,stderr  
  socat TCP4-LISTEN:9000,fork SYSTEM:'./update_docker.sh'
  #nc -l -p 9000 -c ./update_docker.sh
done
