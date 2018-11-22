const express = require('express')
const app = express()
const port = 3000
var assert = require('assert');
const cassandra = require('cassandra-driver');
var contactPoints = ['127.0.0.1:9042'];
var client = new cassandra.Client({ contactPoints:contactPoints, keyspace: 'lambda_arch' });
var methodOverride = require('method-override');
var bodyParser = require('body-parser');
client.connect(function (err) {
  assert.ifError(err);
});

app.use(methodOverride());
app.use(bodyParser.json());    
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', (req, res) => res.send('Hello World!'))

app.get('/gateway', async function (req, res) {
    const query = "select * from emp";
    client.execute(query, function(err, result) {
        assert.ifError(err);
        res.send(JSON.stringify(result));
    });
});

app.post('/gateway', function (req, res) {
    var postData = req.body;
    var tableName = postData.table;
    var fieldNames = postData.fields;
    var rowData = postData.row;    
    const query = `INSERT INTO ${tableName} ( ${fieldNames} ) VALUES ( ${rowData} ) `;
    client.execute(query, function(err, result) {
        assert.ifError(err);
        res.send(JSON.stringify("Success"));
    });
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
