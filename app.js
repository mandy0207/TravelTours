const express = require("express");
const path = require("path");
var mysql = require('mysql')
    //for Payment
const dotenv = require("dotenv");
const cors = require("cors");
const bodyParser = require("body-parser");
const crypto = require("crypto");
const Razorpay = require("razorpay");
const { json } = require("body-parser");
dotenv.config();
const instance = new Razorpay({
    key_id: process.env.KEY_ID,
    key_secret: process.env.KEY_SECRET
});
const app = express();
app.use(cors());
app.use(express.json());
app.use(
    bodyParser.urlencoded({
        extended: false
    })
);
app.use(bodyParser.json());
//for payment
//const app = express();

const port = process.env.PORT || 3600;



// Express Specific stuff
app.use('/static', express.static('static'));;
app.use(express.urlencoded());

//Set the template engine as HTML
app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');
app.set('views', path.join(__dirname, 'views'))



var connection = mysql.createConnection({
    host: 'bpjulenikxikwvubkdby-mysql.services.clever-cloud.com',
    user: 'uhtjcfavbow6glym',
    password: 'ugz9v5YiGiz0o2FYh6Cd',
    database: 'bpjulenikxikwvubkdby'

});

connection.connect(function(err) {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }

  console.log('connected as id ' + connection.threadId);
});








// End Points

app.get('/', (req, res) => {
    res.status(200).render('Home.html');
})
app.get('/Packages', (req, res) => {
    res.status(200).render('Packages.html');
})

app.post('/Packages', (req, res) => {
    karams = JSON.parse(JSON.stringify(req.body));
    console.log(karams);

    var insertquery = `select * from packages where Source='${karams.source}' AND Destination='${karams.destination}' AND '${karams.travellers}' `;
    connection.query(insertquery, function(err, response) {
        if (err) throw err
        res.status(200).render('PackagesPost.html', { arra: response });
        console.log(response);
    });


});

app.get('/Register', (req, res) => {
    res.status(200).render('Home.html');
})
app.get('/home', (req, res) => {
    res.status(200).render('Home.html');
})
app.get('/Signup', (req, res) => {
    res.status(200).render('Signup.html');
})

app.get('/Login', (req, res) => {
    res.status(200).render('Login.html');
})

app.get('/Flights', (req, res) => {
    res.status(200).render('Flights.html');
})

app.get('/Checkin', (req, res) => {
    res.status(200).render('Checkin.html');
})

app.post('/Checkin', (req, res) => {
    karams = JSON.parse(JSON.stringify(req.body));
    //params = req.body;
    //console.log(karams);
    //console.log(karams.name);
    var selectquery = `select * from tickets where Name='${karams.name}' AND EmailId='${karams.email}'`;
    connection.query(selectquery, function(err, response) {
        if (err) throw err
            //console.log(response);
        res.status(200).render('CheckinDetails.html', { Frra: response });
        //console.log(response);
    });
})

app.post('/Payment', (req, res) => {
    res.status(200).render('Payment.html', { key: process.env.KEY_ID });
})



app.get('*', (req, res) => {
    res.status(404).render('404.html', {
        errorcomment: "oops! Page not found"
    });
})


app.post('/', (req, res) => {

    var karams = req.body;
    console.log(karams);
    //var insertquery = "select * from `flights` where Source='India'";
    var insertquery = `select * from flights where Source='${karams.source}' AND Destination='${karams.destination}' AND '${karams.travellers}' `;
    connection.query(insertquery, function(err, response) {
        if (err) throw err
            // console.log(response);
        res.status(200).render('Flights', { arra: response });
    });
    //connection.end();

});


app.post('/home', (req, res) => {
    //console.log((req.body.source));
    var karams = req.body;
    console.log(karams);
    var insertquery = `select * from flights where Source='${karams.source}' AND Destination='${karams.destination}' AND '${karams.travellers}' `;

    connection.query(insertquery, function(err, response) {
        if (err) throw err
        console.log(response);
        res.status(200).render('Flights', { arra: response });
    });


});


app.post("/api/Payment/order", (req, res) => {
    params = req.body;
    // console.log(params);
    instance.orders.create(params)
        .then((data) => {
            res.send({ sub: data, status: "Success" });
        })
        .catch((error) => {
            res.send({ sub: error, status: "failed" });
        });
});
app.post("/api/Payment/verify", (req, res) => {

    params = req.body;
    console.log(params);
    //console.log(req.body.bookingEmail);
    body = req.body.razorpay_order_id + "|" + req.body.razorpay_payment_id;
    var expectedSignature = crypto
        .createHmac("sha256", process.env.KEY_SECRET)
        .update(body.toString())
        .digest("hex");
    // console.log("sig" + req.body.razorpay_signature);
    // console.log("sig" + expectedSignature);
    var response = { status: "failure" };
    if (expectedSignature === req.body.razorpay_signature)
        response = { status: "Payment successful" };
    res.send(response);

    // console.log(req.body);
    var insertquery = "insert into `tickets`(`Name`,`EmailId`,`Source`,`Destination`) values (?,?,?,?)";
    var sql = mysql.format(insertquery, [params.fullname, params.bookingEmail, params.source, params.destination]);
    connection.query(sql, function(err, response) {
        //if (err) throw err
        // console.log(response);
        //console.log(err);

    });
    // connection.end();
});


// Last Routes
app.post("/Login", (req, res) => {
    const { email, password } = req.body;
    if (email && password) {
        connection.query(
            "SELECT * FROM users WHERE email = ? AND password = ?", [email, password],
            function(error, results, fields) {
                if (results.length > 0) {
                    currUser = results[0].username;
                    res.render("Home-two.ejs", {
                        user: currUser,
                    });
                } else {
                    alert = "Email id or password is incorrect. ";
                    res.render("Login.ejs", { alert: alert });
                }
            }
        );
    } else {
        alert = "Email or password not found.";
        res.render("Login.ejs", { alert: alert });
    }
});




// Last Routes
app.post("/register", (req, res) => {
    const {
        name,
        email,
        username,
        password,
        conpass,
        country,
        city,
        zipcode,
    } = req.body;
    connection.query(
        "select * from users where email=?", [email],
        function(err, result, fields) {
            if (result.length > 0) {
                alert = "Email already exists.";
                res.render("Signup.ejs", { alert: alert });
                return;
            }
        }
    );
    if (password == conpass) {
        connection.query(
            "insert into users (name,email,username,password,country,city,zipcode) values(?,?,?,?,?,?,?)", [name, email, username, password, country, city, zipcode],
            function(err, result, fields) {
                if (err) {
                    res.send(err.message);
                } else {
                    alert = "You are successfully registered. Please login to continue.";
                    res.render("Login.ejs", { alert: alert });
                }
            }
        );
    } else {
        alert = "Passwords don't match";
        res.render("Signup.ejs", { alert: alert });
    }
});


app.listen(port, () => {
    console.log(`The app started succesfully on ${port}`)
})