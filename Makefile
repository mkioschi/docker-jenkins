help:
	@echo "Utilização: \`make <comando>'. Comandos disponíveis:"
	@echo "  build           para realizar o build da aplicação"
	@echo "  start-server    para iniciar o servidor Docker com a aplicação"
	@echo "  stop-server     para parar o servidor Docker com a aplicação"

# @echo "  start-server   to start the test server"
# @echo "  stop-server    to stop the test server"
# @echo "  test           to perform unit tests.  Provide TEST to perform a specific test."
# @echo "  coverage       to perform unit tests with code coverage. Provide TEST to perform a specific test."
# @echo "  coverage-show  to show the code coverage report"
# @echo "  clean          to remove build artifacts"
# @echo "  docs           to build the Sphinx docs"
# @echo "  docs-show      to view the Sphinx docs"
# @echo "  tag            to modify the version, update changelog, and chag tag"
# @echo "  package        to build the phar and zip files"

.PHONY: build
build:
	docker-compose build
	echo "Build concluído com sucesso!"

.PHONY: start-server
start-server: stop-server
	docker-compose up -d

.PHONY: stop-server
stop-server:
	docker-compose down

.PHONY: restart-server
restart-server: stop-server start-server
