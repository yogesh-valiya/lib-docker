## Install Multiple PHP Versions with virtual host
- <a href="https://manage.accuwebhosting.com/knowledgebase/3328/How-to-Run-Multiple-PHP-Versions-with-Nginx-on-Ubuntu.html" target="_blank">How to Run Multiple PHP Versions with Nginx on Ubuntu</a>

## Install docker
- <a href="https://docs.docker.com/engine/install/ubuntu/" target="_blank">Install Docker on Ubuntu</a>

## Install docker-compose
- <a href="https://docs.docker.com/compose/install/" target="_blank">Install Docker Compose</a>

## Available Docker Images Under This Repo
- `elasticsearch/7.17`
- `opensearch/2.5`
- `mariadb/10.4`
- `mariadb/10.6`

## Available Commands
- Make sure to navigate to the repo folder before running any of the commands below.

### bin/start.sh
- Use this command to launch any docker container.
- Examples:
    - `bin/start.sh elasticsearch/7.17`
    - `bin/start.sh opensearch/2.5`
    - `bin/start.sh mariadb/10.4`
    - `bin/start.sh mariadb/10.6`

### bin/stop.sh
- Use this command to stop any docker container
- Examples:
    - `bin/stop.sh elasticsearch/7.17`
    - `bin/stop.sh opensearch/2.5`
    - `bin/stop.sh mariadb/10.4`
    - `bin/stop.sh mariadb/10.6`

### bin/restart.sh
- Use this command to restart any docker container
- Examples:
    - `bin/restart.sh elasticsearch/7.17`
    - `bin/restart.sh opensearch/2.5`
    - `bin/restart.sh mariadb/10.4`
    - `bin/restart.sh mariadb/10.6`

### bin/status.sh
- Use this command to check the status of any docker container
- Examples:
    - `bin/status.sh`

### bin/shell.sh
- Use this command to open a shell inside any docker container
- Examples
    - `bin/shell.sh elasticsearch717`
    - `bin/shell.sh opensearch25`
    - `bin/shell.sh mariadb104`
    - `bin/shell.sh mariadb106`

## Configuration

### elasticsearch 7.17
- Host: 0.0.0.0
- Port: 43717

### opensearch 2.5
- Host: 0.0.0.0
- Port: 43025

### mariadb 10.4
- Host: 0.0.0.0
- Port: 43104
- User: root
- Password: magento

### mariadb 10.6
- Host: 0.0.0.0
- Port: 43106
- User: root
- Password: magento

## How to Debug
### Run manual docker-compose commands
- Change directory to to docker images folder `cd docker/images/<image_name>/<image_version>/`
- `docker-compose.yml` file is present this folder, so each `docker-compose` command are available here.
- Examples: 
    - `docker-compose up`
    - `docker-compose kill`
    - `docker-compose remove`
    - more details on docker-compose - https://docs.docker.com/compose/reference/
### Facing permission issue
- run `sudo chmod -R 777 docker/volumes/`
### Facing Docker `sudo` Access Issue
![image](https://github.com/yogesh-valiya/lib-docker/assets/66505755/743bcd17-88bd-4190-838d-92b03629221a)
- `sudo groupadd docker`
- `sudo usermod -aG docker $USER`
- `sudo chown root:docker /var/run/docker.sock`
- `sudo chown -R root:docker /var/run/docker`
