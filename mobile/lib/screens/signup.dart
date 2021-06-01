import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dashboard.dart';

class Signup extends StatefulWidget {
	@override
	_SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
	String email = '';
	String password = '';
	String name = '';

	bool checkEmailAddress() {
		var splitEmail = email.split('@');
		var atSignIsNotExists = splitEmail.length == 1;
		var provider = splitEmail.length == 2 ? splitEmail[1] : '';

		if (atSignIsNotExists) {
			return false;
		}

		if (provider != 'ifal.edu.br') {
			return false;
		}

		return true;
	}

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

	Future register(context) async {
		try {
		  var response = await http.post(
		    Uri.parse('http://localhost:3333/signup'),
		    headers: {
		      'Content-Type': 'application/json; charset=UTF-8',
		    },
		    body: jsonEncode({
		    	'name': name,
		      'email': email,
		      'password': password
		    })
		  );
		  var result = jsonDecode(response.body);

		  if (result['ok']) {
		  	Navigator.pushReplacement(
		  		context,
		  		MaterialPageRoute(
		  			builder: (context) => Dashboard(name)
		  		)
		  	);
		  } else if (result['status'] == 1) {
		  	popup(
		  		context,
		  		'Ops',
		  		'Já existe uma conta utilizando esse endereço de e-mail'
		  	);
		  } else {
		  	popup(
		  		context,
		  		'Erro',
		  		'Sinto muito. Não foi possível criar a sua conta'
		  	);
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
			      	  	"CADASTRAR-SE",
			      	  	style: const TextStyle(
			      	  		color: Colors.black,
			      	  		fontWeight: FontWeight.bold,
			      	  		fontSize: 18.0
			      	  	)
			      		),
			      		SizedBox(height: 30),
			      		TextField(
			      			onChanged: (text) {
			      				name = text;
			      			},
			      			decoration: InputDecoration(
			      				labelText: 'Nome',
			      				border: OutlineInputBorder()
			      			)
			      		),
			      		SizedBox(height: 15),
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
									      	var fieldsAreFilled = name != '' && email != '' && password != '';

									      	if (fieldsAreFilled) {
									      		if (checkEmailAddress()) {
									      			register(context);
									      		} else {
									      			popup(
									      				context,
									      				'Atenção!',
									      				'Seu e-mail está formatado incorretamente. Todos os e-mails devem conter "@ifal.edu.br"'
									      			);
									      		}
									      	} else {
									      		popup(
									      			context,
									      			'Atenção!',
									      			'Preencha todos os campos antes de continuar.'
									      		);
									    		}
									    	},
									    	child: Padding(
									    		padding: const EdgeInsets.all(12.0),
									    		child: Text('CRIAR CONTA'),
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
					            	Navigator.of(context).pushReplacementNamed('/');
					            },
					            child: const Text('Já tem uma conta? Faça Login'),
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