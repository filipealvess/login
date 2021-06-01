const config = require('../config.js');

module.exports = function (request, response) {
	config.openConnection();

	const sql = 'SELECT * FROM users WHERE email = ? AND password = ?';
	const { email, password } = request.body;

	config.database.get(sql, [email, password], (error, row) => {
		if (error) {
			return response.json({
				ok: false,
				status: 0,
				message: 'Error: ' + error.message
			});
		}

		if (row) {
			return response.json({
				ok: true,
				status: 1,
				user: row,
				message: 'Authenticated successfully'
			});
		}

		return response.json({
			ok: true,
			status: 2,
			message: 'Email and/or password don\'t match'
		});
	});

	config.closeConnection();
}