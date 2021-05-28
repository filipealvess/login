import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
	@override
	_SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
	String email = '';
	String password = '';

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
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
								      		print('Conta criada com sucesso!');
								      	} else {
								      		print('Preencha todos os campos antes de continuar.');
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
		);
	}
}