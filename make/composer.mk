# PHP Composerを使う場合必要
composer: composer.json
	php composer.phar install --no-dev
composer.json: composer.phar
	php composer.phar init
composer.phar:
	curl -sS https://getcomposer.org/installer | php
