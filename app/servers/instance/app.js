
/**
 * Module dependencies.
 */

var express = require('express')
  , routes = require('./routes');

var app = module.exports = express.createServer();
var newUmask = process.umask(0775);
var port;

// Configuration

app.configure(function(){
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
  port = 8090;
});

app.configure('production', function(){
  app.use(express.errorHandler());
  port = '/tmp/tugowa-api.sock';
});

// Routes

app.get('/', routes.index);
app.get('/recv', routes.recv);

app.listen(port, function(){
  process.umask(newUmask);
  console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
});
