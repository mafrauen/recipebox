
/**
 * Module dependencies.
 */

require('coffee-script');

var express = require('express')
  , redis = require('redis')
  , redisConfig = require('./redis-config')(redis)
  , RedisStore = require('connect-redis')(express);

var app = module.exports = express.createServer();

// Configuration

app.configure(function(){
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.cookieParser());
  app.use(express.session({
    secret: 'this is my secret'
   ,store: new RedisStore(redis)
  }));
  app.use(require('stylus').middleware({ src: __dirname + '/public' }));
  app.use(require('connect-assets')());
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.configure('production', function(){
  app.use(express.errorHandler());
});

// Routes
require('./routes/recipe')(app, redisConfig.db);

app.listen(3000, function(){
  console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
});
