# technical test Laravel 6.0 

This repository contains the code for solving the technical test at Ideaware, also some cases of use of the framework's features like:

- [Authentication](https://laravel.com/docs/6.0/authentication)
- API
  - Token authentication
  - [API Resources](https://laravel.com/docs/6.0/eloquent-resources)
  - Versioning
- [Blade](https://laravel.com/docs/6.0/blade)
- [Broadcasting](https://laravel.com/docs/6.0/broadcasting)
- [Cache](https://laravel.com/docs/6.0/cache)
- [Email Verification](https://laravel.com/docs/6.0/verification)
- [Filesystem](https://laravel.com/docs/6.0/filesystem)
- [Helpers](https://laravel.com/docs/6.0/helpers)
- [Horizon](https://laravel.com/docs/6.0/horizon)
- [Localization](https://laravel.com/docs/6.0/localization)
- [Mail](https://laravel.com/docs/6.0/mail)
- [Migrations](https://laravel.com/docs/6.0/migrations)
- [Policies](https://laravel.com/docs/6.0/authorization)
- [Providers](https://laravel.com/docs/6.0/providers)
- [Requests](https://laravel.com/docs/6.0/validation#form-request-validation)
- [Seeding & Factories](https://laravel.com/docs/6.0/seeding)
- [Testing](https://laravel.com/docs/6.0/testing)

Beside Laravel, this project uses other tools like:

- [Bootstrap 4](https://getbootstrap.com/)
- [PHP-CS-Fixer](https://github.com/FriendsOfPhp/PHP-CS-Fixer)
- [Travis CI](https://travis-ci.org/)
- [Font Awesome](http://fontawesome.io/)
- [Vue.js](https://vuejs.org/)
- [axios](https://github.com/mzabriskie/axios)
- [Redis](https://redis.io/)
- [spatie/laravel-medialibrary](https://github.com/spatie/laravel-medialibrary)


## Installation

Development environment requirements :
- [Docker](https://www.docker.com) >= 17.06 CE
- [Docker Compose](https://docs.docker.com/compose/install/)

Setting up your development environment on your local machine :
```bash
$ git clone https://github.com/guillaumebriday/laravel-blog.git
$ cd laravel-blog
$ sudo chmod u+x ./build.sh
$ ./build.sh
```

Now you can access the application via [http://localhost:8000](http://localhost:8000).

**There is no need to run ```php artisan serve```. PHP is already running in a dedicated container.**

This will create a new user that you can use to sign in :
```yml
email: admin@admin.com
password: admin
```

## Useful commands
Seeding the database :
```bash
$ docker-compose run --rm blog-server php artisan db:seed
```

Running tests :
```bash
$ docker-compose run --rm blog-server ./vendor/bin/phpunit --cache-result --order-by=defects --stop-on-defect
```

Running php-cs-fixer :
```bash
$ docker-compose run --rm --no-deps blog-server ./vendor/bin/php-cs-fixer fix --config=.php_cs --verbose --dry-run --diff
```

Generating backup :
```bash
$ docker-compose run --rm blog-server php artisan vendor:publish --provider="Spatie\Backup\BackupServiceProvider"
$ docker-compose run --rm blog-server php artisan backup:run
```

Generating fake data :
```bash
$ docker-compose run --rm blog-server php artisan db:seed --class=DevDatabaseSeeder
```

Discover package
```bash
$ docker-compose run --rm --no-deps blog-server php artisan package:discover
```

In development environnement, rebuild the database :
```bash
$ docker-compose run --rm blog-server php artisan migrate:fresh --seed
```

## Accessing the API

You can access to the REST API. API requests require authentication via token. You can create a new token in your user profile.

Then, you can use this token either as url parameter or in Authorization header :

```bash
# Url parameter
GET http://laravel-blog.app/api/v1/posts?api_token=your_private_token_here

# Authorization Header
curl --header "Authorization: Bearer your_private_token_here" http://laravel-blog.app/api/v1/posts
```

API are prefixed by ```api``` and the API version number like so ```v1```.

Do not forget to set the ```X-Requested-With``` header to ```XMLHttpRequest```. Otherwise, Laravel won't recognize the call as an AJAX request.

To list all the available routes for API :

```bash
$ docker-compose run --rm --no-deps blog-server php artisan route:list --path=api
```
