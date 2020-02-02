#!/bin/bash

cp .env.example .env
docker-compose run --rm --no-deps blog-server composer install
docker-compose run --rm --no-deps blog-server php artisan key:generate
docker-compose run --rm --no-deps blog-server php artisan horizon:install
docker-compose run --rm --no-deps blog-server php artisan telescope:install
docker-compose run --rm --no-deps blog-server php artisan storage:link
docker run --rm -it -v $(pwd):/app -w /app node yarn
docker-compose up -d
docker-compose run --rm --no-deps blog-server php artisan cache:clear
docker-compose run --rm --no-deps blog-server chmod -R 777 storage/
docker-compose run --rm --no-deps blog-server composer dump-autoload
docker-compose run --rm blog-server php artisan migrate --seed
docker run --rm -it -v $(pwd):/app -w /app node yarn dev
docker-compose run --rm blog-server php artisan db:seed