import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  final TextEditingController _nameController = TextEditingController();

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  void _navigate() {
    if (_nameController.text.isNotEmpty) {
      Navigator.pushNamed(
        context,
        '/result',
        arguments: {'name': _nameController.text, 'counter': _counter},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contador')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              key: const Key('nameField'),
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 10),
            Text('Contador: $_counter', key: const Key('counterText')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  key: const Key('incrementBtn'),
                  onPressed: _increment,
                  child: const Text('+'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  key: const Key('decrementBtn'),
                  onPressed: _decrement,
                  child: const Text('-'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  key: const Key('resetBtn'),
                  onPressed: _reset,
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              key: const Key('navigateBtn'),
              onPressed: _navigate,
              child: const Text('Ir a Resultados'),
            ),
          ],
        ),
      ),
    );
  }
}
