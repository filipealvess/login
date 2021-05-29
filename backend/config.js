const sqlite3 = require('sqlite3').verbose();

let database;

function openConnection() {
	database = new sqlite3.Database('./database/database.db', sqlite3.OPEN_READWRITE, error => {
		if (error) {
			return console.error(error.message);
		}
  	
  	console.log('Database connected.');
	});
}

function createUsersTable() {
	openConnection();
	database.run(`
		CREATE TABLE IF NOT EXISTS users(
			email text PRIMARY KEY,
			password text NOT NULL,
			name text
		);
	`);
	closeConnection();
}

function closeConnection() {
	database.close(error => {
		if (error) {
			return console.error(error.message);
		}
  	
  	console.log('Database closed.');
	});
}

module.exports = {
	openConnection,
	closeConnection,
	createUsersTable
}