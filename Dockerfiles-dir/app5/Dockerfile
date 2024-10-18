FROM python:3.10
WORKDIR /usr/local/docker-first-test

COPY hello_world_my.py ./
ENV DOCKER_ENV "First test docker"
ENV DOCKER_ENV_INT_ARG "5"

CMD [ "python", "hello_world_my.py" ]
