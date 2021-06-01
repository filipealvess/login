import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dashboard.dart';

class Signin extends StatefulWidget {
	@override
	_SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
	String email = '';
	String password = '';

	void popup(context, title, content) {
		showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: Text('OK'),
          ),
        ],
      ),
    );
	}

	Future authenticate(context) async {
		try {
		  var response = await http.post(
		    Uri.parse('http://localhost:3333/signin'),
		    headers: {
		      'Content-Type': 'application/json; charset=UTF-8',
		    },
		    body: jsonEncode({
		      'email': email,
		      'password': password,
		    })
		  );
		  var result = jsonDecode(response.body);

		  var authenticatedSuccessfully = result['ok'] && result['status'] == 1;

		  if (authenticatedSuccessfully) {
		  	Navigator.pushReplacement(
		  		context,
		  		MaterialPageRoute(
		  			builder: (context) => Dashboard(result['user']['name'])
		  		)
		  	);
		  } else {
		  	popup(context, 'Login inválido', 'E-mail e/ou senha inválidos');
		  }
		} catch (error) {
			popup(
				context,
				'Erro',
				'Ocorreu um erro ao tentar conectar ao banco de dados. Tente acessar mais tarde :\')'
			);
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
      body: SingleChildScrollView(
      	child: SizedBox(
      		width: MediaQuery.of(context).size.width,
      		height: MediaQuery.of(context).size.height,
	      	child: Padding(
      			padding: const EdgeInsets.all(15.0),
	      		child: Column(
		      		mainAxisAlignment: MainAxisAlignment.center,
			      	children: [
			      		Text(
			      	  	"FAZER LOGIN",
			      	  	style: const TextStyle(
			      	  		color: Colors.black,
			      	  		fontWeight: FontWeight.bold,
			      	  		fontSize: 18.0
			      	  	)
			      		),
			      		SizedBox(height: 30),
			      		TextField(
			      			onChanged: (text) {
			      				email = text;
			      			},
			      			keyboardType: TextInputType.emailAddress,
			      			decoration: InputDecoration(
			      				labelText: 'E-mail',
			      				border: OutlineInputBorder()
			      			)
			      		),
			      		SizedBox(height: 15),
			      		TextField(
			      			onChanged: (text) {
			      				password = text;
			      			},
			      			obscureText: true,
			      			decoration: InputDecoration(
			      				labelText: 'Senha',
			      				border: OutlineInputBorder()
			      			)
			      		),
			      		SizedBox(height: 15),
			      		Row(
				      		children: [
					      		Expanded(
							      	child: ElevatedButton(
									      onPressed: () {
									      	if (email != '' && password != '') {
									      		authenticate(context);
									      	} else {
									      		popup(context, 'Atenção!', 'Preencha todos os campos antes de continuar');
									    		}
									    	},
									    	child: Padding(
									    		padding: const EdgeInsets.all(12.0),
									    		child: Text('ENTRAR'),
									    	)
									    )
					      		)
				      		]
			      		),
			      		SizedBox(height: 15),
						    Row(
							    children: [
								    TextButton(
					            onPressed: () {
					            	Navigator.of(context).pushReplacementNamed('/novo');
					            },
					            child: const Text('Não tem uma conta? Cadastre-se.'),
					          )
				      		]
						    )
			      	]
		      	)
	      	)
	      )
      )
    );
	}
}
