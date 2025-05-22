import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String name = args['name'];
    final int counter = args['counter'];

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados')),
      body: Center(
        child: Text('Hola $name, tu contador es $counter',
            style: const TextStyle(fontSize: 20), key: Key('resultText')),
      ),
    );
  }
}
