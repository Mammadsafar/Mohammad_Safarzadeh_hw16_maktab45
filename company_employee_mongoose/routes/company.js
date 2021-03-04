const express = require('express');
const router = express.Router();
const company = require('../models/company');
/* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });


router.get('/companyPages', function (req, res) {
    company.find({}, (err, companies) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        // res.json(companies);
        res.render('companiesInfo', {
            companies
        });
    });
})



// ? -------------------------------------- < ready company > ---------------------
router.get('/all', (req, res) => {
    company.find({}, (err, companies) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(companies);
    });
});

// todo -------------------------------- < find last years for req.params.id > --------------------------------
router.get('/recently:id', (req, res) => {
    var pastYear = new Date().getFullYear() - req.params.id;

    company.find({
        "date_registered": {
            $gt: `${pastYear}`
        }
    }, (err, companies) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(companies);
    });
});
// todo -------------------------------- < / find last years for req.params.id >
router.get('/:id', (req, res) => {

    company.findOne({
        _id: req.params.id
    }, (err, company) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(companies);
    })

});



// ? -------------------------------------- < create company > ---------------------
router.put('/', (req, res) => {

    console.log(req);

    const newCompany = new company({

        name: req.body.name,
        id_register: req.body.id_register,
        city: req.body.city,
        province: req.body.province,
        date_registered: req.body.date_registered,
        phone_number: req.body.phone_number

    });

    newCompany.save((err, company) => {
        console.log(105);
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(company);
    })


});
// ? -------------------------------------- < update company > ---------------------

router.post('/changeCity', (req, res) => {

    console.log( req.body.city);
    console.log( req.body.province);

        company.updateMany({"__v" : 0},
            req.body, {
                city: req.body.city,
                province: req.body.province
            }, (err, company) => {
                if (err) return res.status(500).json({
                    msg: "Server Error :)",
                    err: err.msg
                });
                res.json(company);
            })


});



router.post('/:id', (req, res) => {
    
    console.log(req.body);

    company.findOneAndUpdate({
        _id: req.params.id
    }, req.body, {
        name: req.body.name,
        id_register: req.body.id_register,
        city: req.body.city,
        province: req.body.province,
        date_registered: req.body.date_registered,
        phone_number: req.body.phone_number
    }, (err, company) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(company);
    })
});
// ? -------------------------------------- < delete company > ---------------------
router.delete('/:id', (req, res) => {
    company.findOneAndDelete({
        _id: req.params.id
    }, (err, company) => {
        if (err) return res.status(500).json({
            msg: "Server Error :)",
            err: err.msg
        });
        res.json(company);
    })
});



module.exports = router;