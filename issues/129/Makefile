build:
	docker compose build --no-cache

up:
	docker compose up -d

down:
	docker compose down -v --remove-orphans

restart:
	make down
	make up

migrate_refresh:
	docker compose exec app php artisan migrate:refresh --seed

reset:
	make down
	make up
	make migrate_refresh
