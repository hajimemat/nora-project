all:
	make install
install:
	[ -a composer.json ] && make -f make/composer.mk composer || echo 'composer.json no'
	[ -a package.json ] && make -f make/npm.mk npm || echo 'package.json no'
	[ -a gulpfile.coffee ] && make -f make/npm.mk gulp || echo 'gulp.coffee no'

# WEBを開始する
web: public/assets/script public/assets/style
public/assets/script: public/assets
	ln -sf $(realpath build/script) $@
public/assets/style: public/assets
	ln -sf $(realpath build/style) $@
public/assets:
	mkdir $@

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
