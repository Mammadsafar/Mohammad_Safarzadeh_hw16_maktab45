const express = require('express');
const router = express.Router();
const employeeRouter = require('./employees');
const companyRouter = require('./company');
/* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });
router.use('/company', companyRouter);
router.use('/employee', employeeRouter);
module.exports = router;