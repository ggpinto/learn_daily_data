install:
	apt-get update &&\
		xargs -a requirements.txt apt-get install