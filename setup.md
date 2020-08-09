# Installing GoCD in docker

## Step 1: Create a network

```bash
docker network create gocd
```

## Step 2: Create volumes for gocd persistence and launch the container

```shell
docker volume create gocd
docker volume create gocd-data
```

## Step 3: launch the container with above network and volume

```bash
docker container run --name gocd-server --rm --detach   --privileged --network gocd --network-alias docker   --volume gocd:/home/go   --volume gocd-data:/godata   --publish 8153:8153 gocd/gocd-server:v20.6.0
  ```

```bash
docker container run --privileged --name gocd-agent1 --rm --detach \
  --network gocd --env GO_SERVER_URL=http://gocd-server:8153/go gocd/gocd-agent-docker-dind:v20.6.0
  ```

###### ref: 
###### * https://github.com/gocd-contrib/github-oauth-authorization-plugin/blob/master/INSTALL.md
###### *  https://github.com/NdagiStanley/django_girls_complete.git


## Plugins used

* github-oauth-authorization-plugin
* Github Pull Requests Builder
* Github Pull Requests status notifier
* Artifact plugin for S3
