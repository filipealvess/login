import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
	final String userName;
  Dashboard(this.userName);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.blueAccent,
				title: Text('Dashboard'),
				actions: [
					IconButton(
						icon: const Icon(Icons.exit_to_app_rounded),
						tooltip: 'Sair',
						onPressed: () {
							Navigator.of(context).pushReplacementNamed('/');
						}
					)
				]
			),
			body: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Padding(
						padding: const EdgeInsets.all(15.0),
						child: Column(
							children: [
								Text(
									'Olá, $userName! Tudo bem?',
									style: const TextStyle(
									  fontSize: 18.0
									)
								),
								SizedBox(height: 15.0),
								Text(
									'O aplicativo está em construção, em breve teremos novidades!',
									style: const TextStyle(
									  fontSize: 16.0
									)
								)
							]
						)
					)
				]
			)
		);
	}
}