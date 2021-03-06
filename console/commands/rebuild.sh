#!/usr/bin/env bash
set -euo pipefail

printf "${GREEN}Rebuilding and starting containers in detached mode${COLOR_RESET}\n"

if [ "$#" == 0 ]; then
    ${COMMANDS_DIR}/stop.sh
    ${DOCKER_COMPOSE} up --build -d ${SERVICE_APP}
else
    ${COMMANDS_DIR}/stop.sh "$@"
    ${DOCKER_COMPOSE} up --build -d "$@"
fi

${TASKS_DIR}/validate_bind_mounts.sh
