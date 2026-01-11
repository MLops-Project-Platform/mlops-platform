FROM python:slim
WORKDIR /workspace

RUN apt-get update \
 && apt-get install -y --no-install-recommends curl wget netcat-openbsd git bash  \
 && rm -rf /var/lib/apt/lists/*


RUN python -m pip install --upgrade pip
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt
CMD ["python", "src/train.py"]