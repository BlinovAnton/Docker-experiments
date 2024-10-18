#!/bin/bash

D_IMAGE_NAME=docker-first-test-tag
TEST_MODE=0
MAIN_ARGS=$@
MAIN_ARGS=${MAIN_ARGS//"test"/}

if [[ "$1" = "help" ]]; then
	echo -e "Use "$0" (build | run | 'nothing') [test]"
	echo -e " -- 'nothing' to exec 'docker build' and 'docker run'"
	echo -e " -- 'build' to exec 'docker build' for dockerfiles"
	echo -e " -- 'run' to exec 'docker run' for built images"
	echo -e " -- 'test' to show commands, which will be executed," \
	        "but not exec it"
fi

if [[ "$@" == *"test"* ]]; then
	TEST_MODE=1
	echo -e "Next commands will be executed:"
fi

function my_exec_cmd {
	if [[ $TEST_MODE = 1 ]]; then
		echo -e " -- "$@
	else
		$@
	fi
}

if [[ "$MAIN_ARGS" == *"build"* || "$MAIN_ARGS" = "" ]]; then
	CMD="docker build --rm=false --tag $D_IMAGE_NAME:1.0 ." && my_exec_cmd $CMD
	for NUM in $(seq 2 5)
	do
		CMD="docker build --file Dockerfile.$NUM --rm=false --tag $D_IMAGE_NAME:1.$NUM ."
		my_exec_cmd $CMD
	done
fi

if [[ "$MAIN_ARGS" == *"run"* || "$MAIN_ARGS" = "" ]]; then
	CMD="docker run -d $D_IMAGE_NAME:1.0" && my_exec_cmd $CMD
	for NUM in $(seq 2 5)
	do
		CMD="docker run -d $D_IMAGE_NAME:1.$NUM" && my_exec_cmd $CMD
	done
fi

if [[ "$MAIN_ARGS" = *"stop"* ]]; then
	CMD="docker stop $(docker ps | grep docker-first-test-tag | awk '{print $1}')"
	my_exec_cmd $CMD
fi
