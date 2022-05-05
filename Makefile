.PHONY: setup
setup:
	docker compose build --no-cache --force-rm
	mkdir -p hugo/themes
	docker compose run --rm hugo git clone https://github.com/pdevty/material-design themes

.PHONY: up_hugo
up_hugo:
	docker compose up hugo

.PHONY: clean
clean:
	docker compose down -v --rmi all