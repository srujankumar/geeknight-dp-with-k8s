var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
    res.status(200).send({environment_var: process.env.DOCKER});
});

module.exports = router;
