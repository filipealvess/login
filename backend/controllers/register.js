const config = require('../config.js');

module.exports = function (request, response) {
	config.openConnection();

	const sql = 'INSERT INTO users(email, password, name) VALUES(?, ?, ?)';
	const { email, password, name } = request.body;

	config.database.run(sql, [email, password, name], error => {
		if (error) {
			if (error.message === 'SQLITE_CONSTRAINT: UNIQUE constraint failed: users.email') {
				return response.json({
					ok: false,
					status: 1,
					message: 'Email error: this email already exists in the database'
				});
			}

			return response.json({
				ok: false,
				status: 0,
				message: 'Unknown error: ' + error.message
			});
		}

		return response.json({
			ok: true,
			status: 2,
			data: request.body,
			message: 'User registered successfully'
		});
	});

	config.closeConnection();
}