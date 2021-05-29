const config = require('../config.js');

module.exports = function (request, response) {
	config.openConnection();

	const sql = 'INSERT INTO users(email, password, name) VALUES(?, ?, ?)';
	const { email, password, name } = request.body;

	config.database.run(sql, [email, password, name], error => {
		if (error) {
			return response.json({
				ok: false,
				message: 'Error: ' + error.message
			});
		}

		return response.json({
			ok: true,
			data: request.body,
			message: 'User registered successfully'
		});
	});

	config.closeConnection();
}