import os, time, argparse

STEP_TIME = 1

if __name__ == '__main__':
	uptime = 0
	parser = argparse.ArgumentParser()
	parser.add_argument('-n', '--number', \
	                    type = int, \
	                    help = 'Input sequence number ' \
	                           'of instance of this script', \
	                    default = os.environ.get("DOCKER_ENV_INT_ARG")
	)
	args = parser.parse_args()
	number = args.number
	while True:
		try:
			print(f'Hello, my DOCKER_ENV is ' \
			      f'\"{ os.environ.get("DOCKER_ENV") } #{number}\", ' \
			      f'sleeping {uptime} seconds')
			time.sleep(STEP_TIME)
			uptime += STEP_TIME
		except KeyboardInterrupt:
			print('\n--good end--')
			break
	exit(0)
