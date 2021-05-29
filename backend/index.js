const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const sqlite3 = require('sqlite3').verbose();
const app = express();
const port = 3333 || process.env.PORT;

app.use(cors());
app.use(bodyParser.json());

const databasePath = './database/database.db';
const sqliteRule = sqlite3.OPEN_READWRITE;
let database;

function openConnection() {
	database = new sqlite3.Database(databasePath, sqliteRule, error => {
		if (error) {
			return console.error(error.message);
		}
  	
  	console.log('Database connected.');
	});
}

function closeConnection() {
	database.close(error => {
		if (error) {
			return console.error(error.message);
		}
  	
  	console.log('Database closed.');
	});
}

app.listen(port, () => {
	console.log('Backend is running at localhost:' + port);
});