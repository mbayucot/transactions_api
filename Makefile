build:
	docker-compose build

rebuild:
	docker-compose up --build

start:
	docker-compose up

setup:
	#docker-compose run web rails db:create db:migrate
	docker-compose run web rails db:reset

restart:
	docker-compose restart web

stop:
	docker-compose stop

rspec:
	docker exec -it transactions_api bash -c "bundle exec rspec"

login:
	docker exec -it transactions_api bash

postgres:
	docker exec -it transactions_postgres bash -c "psql transactions_api_development -U myuser"
