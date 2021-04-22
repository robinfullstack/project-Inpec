var gulp        = require('gulp'),
    concat      = require('gulp-concat'),
    uglify      = require('gulp-uglify'),
    jade        = require('gulp-jade'),
    less        = require('gulp-less'),
    path        = require('path'),
    livereload  = require('gulp-livereload'), // Livereload plugin needed: https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei
    embedlr     = require("gulp-embedlr"),
    tinylr      = require('tiny-lr'),
    marked      = require('marked'), // For :markdown filter in jade
    path        = require('path'),
    changed     = require('gulp-changed'),
    prettify    = require('gulp-html-prettify'),
    htmlhint    = require("gulp-htmlhint"),
    server      = tinylr();

// CONFIG
var source = {
    scripts: ['js/modules/*.js', 'js/app.init.js'],
    templates: {
        'files' : ['jade/*.jade'],
        'watch': ['jade/**/*.jade', 'jade/*.jade']
    },
    styles: {
        main: 'less/app.less',
        dir:  'less',
        watch: ['less/*.less', 'less/**/*.less']
    },
    bs: {
        main: 'less/bootstrap/bootstrap.less',
        dir:  'less/bootstrap',
        watch: ['less/bootstrap/*.less']
    }
};

var build = {
    scripts: {
        main: 'app.js',
        dir: '../app/js'
    },
    styles: '../app/css',
    templates: '..'
};

var lvr_port = 35729;

// JS
gulp.task('scripts', function() {
    // Minify and copy all JavaScript (except vendor scripts)
    return gulp.src(source.scripts)
        //.pipe(uglify())  /* UNCOMMENT TO MINIFY */
        .pipe(concat(build.scripts.main))
        .pipe(gulp.dest(build.scripts.dir))
        .pipe( livereload( server ));
});

// LESS
gulp.task('styles', function() {
    return gulp.src(source.styles.main)
        .pipe(less({
            paths: [source.styles.dir]
        }))
        .on("error", handleError)
        .pipe(gulp.dest(build.styles))
        .pipe( livereload( server ));
});

// BOOSTRAP
gulp.task('bootstrap', function() {
    return gulp.src(source.bs.main)
        .pipe(less({
            paths: [source.bs.dir]
        }))
        .on("error", handleError)
        .pipe(gulp.dest(build.styles))
        .pipe( livereload( server ));
});

// JADE
gulp.task('templates', function() {
    return gulp.src(source.templates.files)
        //.pipe(changed(build.templates, { extension: '.html' }))
        .pipe(jade({
            //pretty: true
        }))
        .on("error", handleError)
        .pipe(prettify({
            indent_char: ' ',
            indent_size: 3,
            unformatted: ['a', 'sub', 'sup', 'b', 'i', 'u']
        }))
        //.pipe(embedlr())                    /* UNCOMMENT TO ENALBE LIVERELOAD */
        .pipe(htmlhint())
        .pipe(htmlhint.reporter())
        .pipe(gulp.dest(build.templates))
        //.pipe( livereload( server ) );      /* UNCOMMENT TO ENALBE LIVERELOAD */
});

// Rerun the task when a file changes
gulp.task('watch', function() {
  try {
      server.listen(
        lvr_port,
        function (err) {
        
          if (err) { return console.log(err); }

          gulp.watch(source.scripts,            ['scripts']);
          gulp.watch(source.styles.watch,       ['styles']);
          gulp.watch(source.bs.watch,           ['bootstrap']);
          gulp.watch(source.templates.watch,    ['templates']);
      
      });
  }
  catch(e) {
    console.log(e);
  }

});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['scripts', 'bootstrap', 'styles', 'templates', 'watch']);

function handleError(err) {
  console.log(err.toString());
  this.emit('end');
}
