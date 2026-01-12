# mlops-platform (Local POC)

מטרת הריפו: להרים סביבת MLOps מקומית (POC) שמדמה ארגון:
- MLflow (Tracking + Model Registry)
- Postgres (metadata backend)
- MinIO (S3 artifacts/models)

## Quick Start
```bash
cd docker-compose
docker compose up -d
```

## UIs
```bash
MLflow: http://localhost:5000
MinIO Console: http://localhost:9001
```

MinIO (user: minioadmin, pass: minioadmin123)
bucket: mlflow-artifacts