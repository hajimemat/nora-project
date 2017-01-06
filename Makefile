all:
	make composer
	# npmを使う場合
	make npm
	# Gulpを使う場合
	make gulp


# PHP Composerを使う場合必要
composer: composer.json
	php composer.phar install --no-dev
composer.json: composer.phar
	php composer.phar init
composer.phar:
	curl -sS https://getcomposer.org/installer | php

# NPMを使う場合
npm: package.json
	make .babelrc
package.json: /usr/bin/npm
	npm init
# バベルを使う場合
.babelrc:
	cp $(realpath share/babelrc) $@
# gulpを使う場合
gulp: /usr/bin/gulp package.json 
	npm i --save-dev \
		pretty-hrtime \
		vinyl-buffer \
		gulp \
		gulp-plumber \
		gulp-util \
		gulp-rename \
		gulp-sass \
		gulp-autoprefixer\
		gulp-sourcemaps \
		gulp-uglify \
		gulp-watchify \
		gulp-watch
# react
react: package.json
	npm install --save \
		react \
		react-dom \
		react-router \
		react-router-redux \
		react-redux \
		redux \
	npm install --save-dev \
		babel-preset-es2015 \
		babel-preset-react \
		babelify \
		watchify \
		exorcist \
		compass-importer \
		node-sass \
		nodemon
/usr/bin/gulp:
	sudo npm i -g  gulp-cli
/usr/bin/npm:
	yaourt -S --needed --noconfirm npm
