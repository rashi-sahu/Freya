const express = require('express')
const app = express()
const port = 3000
var assert = require('assert');
const cassandra = require('cassandra-driver');
var contactPoints = ['127.0.0.1:9042'];
var client = new cassandra.Client({ contactPoints:contactPoints, keyspace: 'lambda_arch' });

client.connect(function (err) {
  assert.ifError(err);
});

app.get('/', (req, res) => res.send('Hello World!'))

app.get('/gateway', async function (req, res) {
    const query = "select * from emp";
    client.execute(query, function(err, result) {
        assert.ifError(err);
        res.send(JSON.stringify(result));
    });
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
