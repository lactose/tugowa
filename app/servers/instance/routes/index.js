var url = require("url")
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index', { title: 'Express' })
};
exports.recv = function(req, res){
  //res.render('index', { title: 'Express' })
  var data = req.param('msg', null)
  data += "test"
  res.writeHead(200, {"Content-Type":"application/json"})
  res.write(data)
  res.end()
};
