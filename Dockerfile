FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

# Instala o cron e configura para iniciar no boot
RUN apt-get update && apt-get install -y cron && \
    crontab -l | { cat; echo "*/5 * * * * /bin/bash /app/run_script.sh"; } | crontab -

# Cria um script para executar o Python script
COPY run_script.sh run_script.sh
RUN chmod +x run_script.sh

# Define o comando para iniciar o cron
CMD ["cron", "-f"]
