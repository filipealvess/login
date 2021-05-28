import 'package:flutter/material.dart';
import './screens/signin.dart';
import './screens/signup.dart';

void main(){
	runApp(
		MaterialApp(
    	initialRoute: '/',
    	routes: {
    		'/': (context) => Signin(),
    		'/novo': (context) => Signup(),
    	}
    )
	);
}

// [ ] Criar tela "signup.dart"
// [ ] Criar navegação entre "signin" e "signup"
// [ ] Criar servidor com Node.js e SQlite
// [ ] Consumir a API com JavaScript pra ver se tá funcionando direito
// [ ] Consumir a API com Flutter