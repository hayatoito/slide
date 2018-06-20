all: start

setup:
	yarn install

start:
	: # yarn start
	python3 -m http.serve

cache:
	grep -o 'https://.*/images/.*.svg' slide.md | (cd image ; xargs -n 1 curl -O)
