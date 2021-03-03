const express = require('express');
const router = express.Router();
const employee = require('../models/employee');
/* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });


router.get('/employeePages', function (req, res) {
    employee.find({}, (err, companies) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        // res.json(companies);
        res.render('employee', {
            companies
        });
    });
})



// ? -------------------------------------- < ready company > ---------------------

router.get('/all', (req, res) => {
    employee.find({}, (err, employies) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(employies);
    });
});
router.get('/manager', (req, res) => {

    employee.find({
        "manager": true
    }, (err, employee) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(employee);
    })

});
router.get('/:id', (req, res) => {
    let arr = req.params.id.split('-');

    let recentlyYear = new Date().getFullYear() - arr[0];
    let oldYear = new Date().getFullYear() - arr[1];


    employee.find({
        $and: [{
            "birthday": {
                $lt: `${recentlyYear}`
            }
        }, {
            "birthday": {
                $gt: `${oldYear}`
            }
        }]
    }, {
        "_id": 0
    }, (err, employee) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(employee);
    })

});

// ? -------------------------------------- < create company > ---------------------
router.put('/', (req, res) => {



    const newemployee = new employee({
        first_name: req.body.first_name,
        last_name: req.body.last_name,
        national_number: req.body.national_number,
        gender: req.body.gender,
        manager: req.body.manager,
        birthday: req.body.birthday
    });

    newemployee.save((err, employee) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(employee);
    })


});
// ? -------------------------------------- < update company > ---------------------

router.post('/:id', (req, res) => {
    employee.findOneAndUpdate({
        _id: req.params.id
    }, req.body, {
        first_name: req.body.first_name,
        last_name: req.body.last_name,
        national_number: req.body.national_number,
        gender: req.body.gender,
        manager: req.body.manager,
        birthday: req.body.birthday
    }, (err, employee) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(employee);
    })
});
// ? -------------------------------------- < delete company > ---------------------
router.delete('/:id', (req, res) => {
    employee.findOneAndDelete({
        _id: req.params.id
    }, (err, employee) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(employee);
    })
});



module.exports = router;