var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
    res.status(200).send({
        environment_var_username: process.env.ENV_USERNAME,
        environment_var_password: process.env.ENV_PASSWORD,
        environment_var_service_url: process.env.ENV_SERVICE_URL
    });
});

module.exports = router;
