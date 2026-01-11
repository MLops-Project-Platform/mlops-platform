import os
import time
import socket
import mlflow

def env(name: str, default: str) -> str:
    v = os.getenv(name)
    return v.strip() if v else default

MLFLOW_TRACKING_URI = env("MLFLOW_TRACKING_URI", "http://localhost:5000")
EXPERIMENT_NAME = env("MLFLOW_EXPERIMENT", "smoke-test")

def main() -> None:
    mlflow.set_tracking_uri(MLFLOW_TRACKING_URI)
    mlflow.set_experiment(EXPERIMENT_NAME)

    artifact_file = "hello_artifact.txt"
    with open(artifact_file, "w", encoding="utf-8") as f:
        f.write(
            f"hello from mlops smoke test @ {int(time.time())}\n"
            f"host={socket.gethostname()}\n"
            f"tracking_uri={MLFLOW_TRACKING_URI}\n"
        )

    run_name = f"run-{int(time.time())}"
    with mlflow.start_run(run_name=run_name):
        mlflow.log_param("platform", env("PLATFORM", "local"))
        for i in range(5):
            mlflow.log_metric("loss", 1.0 / (i + 1), step=i)
        mlflow.log_artifact(artifact_file, artifact_path="artifacts")

    print(f"OK - MLflow UI -> experiment: {EXPERIMENT_NAME} run: {run_name}")

if __name__ == "__main__":
    main()
