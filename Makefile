COMPOSE_DIR=docker-compose

.PHONY: up down logs smoke init

up:
	cd $(COMPOSE_DIR) && docker compose up -d

down:
	cd $(COMPOSE_DIR) && docker compose down -v

logs:
	cd $(COMPOSE_DIR) && docker compose logs -f --tail=100

init:
	cd $(COMPOSE_DIR) && docker compose run --rm minio-init

smoke:
	cd $(COMPOSE_DIR) && docker exec -e MLFLOW_TRACKING_URI=http://localhost:5000 docker-compose-mlflow-1 python /app/smoke_test.py
