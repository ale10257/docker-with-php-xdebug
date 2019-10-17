################################################################################
################################################################################

## DOCKER ENVIRONMENT ALIASES

env-up() {
  docker-compose up -d
}

env-stop() {
  docker-compose stop
}

env-restart() {
  env-stop
  env-up
}

env-build() {
  docker-compose build
}

env-pull() {
  docker-compose pull
}

env-rebuild() {
  env-build
  env-restart
}

env-logs() {
  docker-compose logs "$@"
}

env-init() {
  env-pull
  env-build
  env-restart
}

env-destroy() {
  docker-compose down -v --remove-orphans
}

env-cd() {
  docker-compose exec php71 bash
}

codecept() {
  docker-compose run --rm php71 vendor/bin/codecept "$@"
}

# Symfony

console() {
  docker-compose run --rm php71 php bin/console "$@"
}

phpunit() {
  EXECUTE="vendor/bin/phpunit"
  if [ -f "bin/phpunit" ]; then
      EXECUTE="bin/phpunit"
  fi
  docker-compose run --rm php71 ${EXECUTE} "$@"
}

# Laravel

artisan() {
  docker-compose run --rm php71 php artisan "$@"
}

# Yii2

yii() {
  docker-compose run --rm php71 php yii "$@"
}

