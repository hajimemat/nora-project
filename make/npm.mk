# NPMを使う場合/
/usr/bin/npm:
	yaourt -S --needed --noconfirm npm
npm: /usr/bin/npm
	make .babelrc
	make package.json
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
/usr/bin/gulp:
	sudo npm i -g  gulp-cli
