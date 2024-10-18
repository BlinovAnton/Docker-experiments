FROM python:3.10
WORKDIR /usr/local/docker-first-test

COPY hello_world_my.py ./
ENV DOCKER_ENV "First test docker"

CMD [ "python", "hello_world_my.py", "-n 1" ]
