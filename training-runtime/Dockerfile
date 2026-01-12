# mlops-platform/training-runtime/Dockerfile
FROM python:slim

WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl \
  && rm -rf /var/lib/apt/lists/*

# מתקין deps של החוקר (מה-context)
COPY requirements.txt /tmp/requirements.txt
RUN python -m pip install --upgrade pip && pip install --no-cache-dir -r /tmp/requirements.txt

# מעתיק את הקוד של החוקר (מה-context)
COPY src/ /workspace/src
COPY configs/ /workspace/configs

ENV PYTHONUNBUFFERED=1

# ברירת מחדל - אפשר לדרוס ב-K8s Job/Argo
CMD ["python", "src/train.py"]
