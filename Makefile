# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Colors definitions                                                          │
# └─────────────────────────────────────────────────────────────────────────────┘
CR=\033[0;31m
CG=\033[0;32m
CY=\033[0;33m
CB=\033[0;36m
RC=\033[0m

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Infra commands                                                              │
# └─────────────────────────────────────────────────────────────────────────────┘
.PHONY: up
up:
	@docker-compose up -d

.PHONY: down
down:
	@docker-compose down

.PHONY: build
build:
	@docker-compose build --no-cache

.PHONY: restart
restart:
	@make down
	@make up

.PHONY: setup
setup:
	@mkdir -p jenkins_logs
	@mkdir -p jenkins_home

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Jenkins commands                                                            │
# └─────────────────────────────────────────────────────────────────────────────┘
.PHONY: bash
bash:
	@docker exec -it jenkins bash

.PHONY: get-password
get-password:
	@docker exec jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Help                                                                        │
# └─────────────────────────────────────────────────────────────────────────────┘
help:
	@echo ""
	@echo "${CY}Usage:${RC}"
	@echo "   make ${CG}<command>${RC}"
	@echo ""
	@echo "${CY}Infra commands:${RC}"
	@echo "${CG}   build               ${RC}Build all containers"
	@echo "${CG}   down                ${RC}Stop all containers"
	@echo "${CG}   restart             ${RC}Restart all containers"
	@echo "${CG}   setup               ${RC}Setup application"
	@echo "${CG}   up                  ${RC}Start all containers"
	@echo ""
	@echo "${CY}Jenkis commands:${RC}"
	@echo "${CG}   bash                ${RC}Open a bash terminal inside the jenkins container"
	@echo "${CG}   get-password        ${RC}Get a initial admin password"
	@echo ""
