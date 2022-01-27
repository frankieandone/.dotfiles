 #!/usr/bin/env bash

 function kill_all_running_containers {
   if [[ $($(docker ps -a -q) | wc -w) -gt 0 ]]; then
     docker stop $(docker ps -a -q) && docker remove $(docker ps -a -q)
   else
     echo "No docker containers are running."
   fi
 }
