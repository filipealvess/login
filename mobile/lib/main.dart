import 'package:flutter/material.dart';
import './screens/signin.dart';
import './screens/signup.dart';

void main(){
	runApp(
		MaterialApp(
    	initialRoute: '/',
    	routes: {
    		'/': (context) => Signin(),
    		'/novo': (context) => Signup()
    	}
    )
	);
}