all:
	make install
install:
	[ -a composer.json ] && make -f make/composer.mk composer || echo 'composer.json no'
	[ -a package.json ] && make -f make/npm.mk npm || echo 'package.json no'
	[ -a gulpfile.coffee ] && make -f make/npm.mk gulp || echo 'gulp.coffee no'

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
