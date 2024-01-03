## Install docker

https://docs.docker.com/engine/install/ubuntu/



## Available Docker Images

elasticsearch/7.17
mariadb/10.4



## Available Commands

Make sure to navigate to the repo folder before running any of the commands below.

### bin/start.sh

Use this command to launch any docker container
Example: `bin/start.sh elasticsearch/7.17` or `bin/start.sh mariadb/10.4`

### bin/stop.sh

Use this command to stop any docker container
Example: `bin/stop.sh elasticsearch/7.17` or `bin/stop.sh mariadb/10.4`

### bin/restart.sh

Use this command to restart any docker container
Example: `bin/restart.sh elasticsearch/7.17` or `bin/restart.sh mariadb/10.4`

### bin/status.sh

Use this command to check the status of any docker container
Example: `bin/status.sh elasticsearch717` or `bin/status.sh mariadb104`

### bin/shell.sh

Use this command to open a shell inside any docker container
Example: `bin/shell.sh elasticsearch717` or `bin/shell.sh mariadb104`
