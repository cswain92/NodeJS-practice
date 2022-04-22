const express = require('express');

const router = express.Router();

router.use('/', (req, res, next) => {
    // console.log(req.url);
    res.send('<h1>Hello From Nodejs!!!</h1>');
});

module.exports = router;