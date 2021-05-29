const sqlite3 = require('sqlite3').verbose();

module.exports = {
	database: null,
	openConnection() {
		this.database = new sqlite3.Database('./database/database.db', sqlite3.OPEN_READWRITE, error => {
			if (error) {
				return console.error(error.message);
			}
	  	
	  	console.log('Database connected.');
		});
	},
	closeConnection() {
		this.database.close(error => {
			if (error) {
				return console.error(error.message);
			}
	  	
	  	console.log('Database closed.');
		});
	},
	createUsersTable() {
		this.openConnection();
		this.database.run(`
			CREATE TABLE IF NOT EXISTS users(
				email text PRIMARY KEY,
				password text NOT NULL,
				name text
			);
		`);
		this.closeConnection();
	}
}