# GNU Make compatible.

OLD_CONTAINERS=$(shell docker ps -qa -f status=exited)

JQ_PARSE="{ s: .docker.container.labels.com.docker.compose.service, e: .docker.container.labels.io.typingduck.env, l: .log }"


gonow: stop_if_running remove_old_container_logs run_containers tail_file

stop_if_running:
	docker-compose stop

remove_old_container_logs: $(OLD_CONTAINERS)
	rm -f filebeat_output.json

run_containers:
	docker-compose up -d

tail_file:
	while [ ! -f filebeat_output.json ]; do sleep 1; done
	tail -F filebeat_output.json | jq $(JQ_PARSE)

$(OLD_CONTAINERS):
	docker rm -v $@
