var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.set('Cache-control', 'public, max-age=0')
  res.set('X-Frame-Options', 'DENY')
  res.set('X-Content-Type-Options', 'nosniff')
  res.set('Content-Security-Policy', "default-src 'none'; script-src 'self'; connect-src 'self'; img-src 'self'; style-src 'self'; base-uri 'self'; form-action 'self'; frame-ancestors 'none'")

  res.redirect("/math")
});


module.exports = router;
