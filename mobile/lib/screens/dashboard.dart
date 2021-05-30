import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Center(
			child: Text(
				'Dashboard',
				style: const TextStyle(
			    color: Colors.black,
			    fontWeight: FontWeight.bold,
			    fontSize: 18.0,
			    decoration: TextDecoration.none
			  )
			)
		);
	}
}
