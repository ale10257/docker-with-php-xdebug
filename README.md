## Docker-compose Nginx + Mysql + Php-fpm (несколько версий) + Xdebug

За основу взята статья Дениса Бондаря https://blog.denisbondar.com/post/phpstorm_docker_xdebug

Масштабируемое решение для связки Docker-compose Nginx + Mysql + Php-fpm в реальной разработке.

Клонируем репозиторий, в корневой папке заупускам `docker-compose up --build`, в файле hosts прописываем домены

`127.0.0.1 hello70.loc`

`127.0.0.1 hello71.loc`

Заходим по адресам hello70.loc и hello71.loc, убеждаемся, что все работает, правим конфигурацию под себя.

В файле docker-compose.yml настройки сети прописаны явно
 
``- subnet: 192.168.220.0/28``

Это значит, что машина хоста получит адрес 192.168.220.1. И, при работе, например, с mysql, вводим команду

``mysql -uroot -p --host 192.168.220.1``

Этот же адрес используем для настроек дебага в PhpStorm. Подробности в статье https://blog.denisbondar.com/post/phpstorm_docker_xdebug
