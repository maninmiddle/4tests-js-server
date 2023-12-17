var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');

var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '709397959',
        database: 'tests'
});

console.log('mysql load....');

connection.connect((error, connection2) => {
        if(error) throw error;

        console.log('mysql load done');

        var app = express();
        var publicDir = (__dirname + '/public/');

        app.use(express.static(publicDir));
        app.use(bodyParser.json());
        app.use(bodyParser.urlencoded({ extended: true }));

        app.get('/getTests', (req, res, next) => {
                connection.query('SELECT * FROM tests', (error, select) => {
                        if (error)
                                console.log(error);

                        if (select.length >= 1) {
                                res.end(JSON.stringify(select));
                        } else {
                                res.end("[ ]");
                        }
                });
        });

        app.get('/getTestById', (req, res, next) => {
                connection.query(`SELECT * FROM tests WHERE id = ${req.query.testId}`, (error, select) => {
                        if (error)
                                console.log(error);

                        if (select.length >= 1) {
                                res.end(JSON.stringify(select[0]));
                        } else {
                                res.end("{ }");
                        }
                });
        });

        app.get('/getTasks', (req, res, next) => {
                connection.query(`SELECT id, testId, text FROM tasks WHERE testId = ${req.query.testId}`, (error, select) => {
                        if (error)
                                console.log(error);

                        if (select.length >= 1) {
                                res.end(JSON.stringify(select));
                        } else {
                                res.end("[ ]");
      }
                });
        });

        app.get('/getVariants', (req, res, next) => {
                connection.query(`SELECT * FROM variants WHERE taskId = ${req.query.taskId}`, (error, select) => {
                        if (error)
                                console.log(error);

                        if (select.length >= 1) {
                                res.end(JSON.stringify(select));
                        } else {
                                res.end("{ }");
                        }
                });
        });

        app.post('/createTest', bodyParser.json(), (req, res) => {
                var body = req.body;

                connection.query("INSERT INTO `tests` (`name`, `subject`, `completeTime`, `password`) " +
                                `VALUES ('${body.name}', '${body.subject}', ${body.completeTime}, '${body.password}');`, (error, select) => {
                        if (error)
                                console.log(error);

                        res.end(`${select.insertId}`);
                });
        });

        app.post('/createTask', bodyParser.json(), (req, res) => {
                var body = req.body;

                connection.query("INSERT INTO `tasks` (`testId`, `text`, `variants`, `rightVariants`) " +
                                `VALUES (${body.testId}, '${body.text}', '${body.variants}', '${body.rightVariants}');`, (error, select) => {
                        if (error)
                                console.log(error);

                        res.end(`${select.insertId}`);
                });
        });

        app.post('/createVariant', bodyParser.json(), (req, res) => {
                var body = req.body;

                connection.query("INSERT INTO `variants` (`taskId`, `text`, `isRight`) " +
                                `VALUES (${body.taskId}, '${body.text}', ${body.isRight});`, (error, select) => {
                        if (error)
                                console.log(error);

                        res.end("{ }");
                });
        });

        app.listen(3000, () => {
                console.log('Api running on port 3000');
        });

        //connection.query('select 1+1', (error1, select1) => { })
})


