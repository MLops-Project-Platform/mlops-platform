COMPOSE_DIR=docker-compose

.PHONY: up down build logs ps init smoke clean

up:
	cd $(COMPOSE_DIR) && docker compose up -d

down:
	cd $(COMPOSE_DIR) && docker compose down -v

build:
	cd $(COMPOSE_DIR) && docker compose build mlflow

logs:
	cd $(COMPOSE_DIR) && docker compose logs -f --tail=120

ps:
	cd $(COMPOSE_DIR) && docker compose ps

init:
	cd $(COMPOSE_DIR) && docker compose run --rm minio-init

smoke:
	cd $(COMPOSE_DIR) && docker exec -e MLFLOW_TRACKING_URI=http://localhost:5000 docker-compose-mlflow-1 python /app/smoke_test.py

clean: down
	docker image prune -f
