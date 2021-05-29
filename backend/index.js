const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const app = express();
const port = 3333 || process.env.PORT;

const config = require('./config.js');
const authenticate = require('./controllers/authenticate.js');
const register = require('./controllers/register.js');

app.use(cors());
app.use(bodyParser.json());

app.post('/signin', authenticate);
app.post('/signup', register);

app.listen(port, () => {
	console.log('Backend is running at localhost:' + port);
	config.createUsersTable();
});