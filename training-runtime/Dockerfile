FROM python:slim

WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl wget git \
 && rm -rf /var/lib/apt/lists/*

# 1) install deps (אפשר לבחור: requirements.txt או pyproject)
COPY requirements.txt /tmp/requirements.txt
RUN python -m pip install --upgrade pip \
 && pip install --no-cache-dir -r /tmp/requirements.txt

# 2) copy the research code into the image
COPY . /workspace

# default command (אפשר להשאיר, או להריץ מה-Job)
CMD ["python", "src/train.py"]
