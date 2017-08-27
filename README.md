# Filebeat 6.0 and docker container logs

Example usage of filebeat 6.0 beta and the new `add_docker_metadata` processor
for processing and shipping docker container logs.

## Working example of the following:

- Using filebeat to ship logs from services running in docker containers.
- Adding container metadata using the new `add_docker_metadata`.
- Adding custom labels to the shipped logs.
- Handling multiline stacktraces before shipping.

## How to use

Filebeat is configured in `filebeat.yml` to ship all docker logs. So best
to have a clean docker environment without any containers running. The
`Makefile` will stop and remove any containers. If this is not too invasive
then the whole can be run as

    make gonow

## Details

The `fake_service.sh` script simulates a standard program writing logs to
stdout.  It is run inside a container using `docker-compose.yml`. Filebeat
is also run as a container and the docker logs directory is mounted inside it.
It is configued to write to a file, which is also mounted by the
`docker-compose.yml` and appears here as `filebeat_output.json`.
