import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Center(
			child: Padding(
				padding: const EdgeInsets.all(10.0),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						Row(
							children: [
								TextButton(
									onPressed: () {
										Navigator.of(context).pushReplacementNamed('/');
									},
									child: Row(
										children: [
											Icon(
									      Icons.arrow_back_rounded,
									      semanticLabel: 'Seta para a esquerda',
									    ),
											Text('SAIR')
										]
									)
								)
							]
						),
						SizedBox(height: 15),
						Text(
							'Dashboard',
							style: const TextStyle(
						    color: Colors.black,
						    fontWeight: FontWeight.bold,
						    fontSize: 18.0,
						    decoration: TextDecoration.none
						  )
						),
					]
				)
			)
		);
	}
}
