setup:
	bin/setup
	yarn install

start:
	bin/dev

console:
	bin/rails console

test:
	yarn run build
	yarn run build:css
	NODE_ENV=test bin/rails test

lint:
	bundle exec rubocop

.PHONY: test
