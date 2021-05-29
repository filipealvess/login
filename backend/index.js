const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const sqlite3 = require('sqlite3').verbose();
const app = express();
const port = 3333 || process.env.PORT;

app.use(cors());
app.use(bodyParser.json());

app.listen(port, () => {
	console.log('Backend is running at localhost:' + port);
});