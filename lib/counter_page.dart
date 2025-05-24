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
// TO DO: poner el decremento hasta 0
  void _decrement() {
    setState(() {
      _counter--;
    });
  }
// TO DO: en el reset se debe considerar que borrar nombre y contador
  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

// TO DO: si es que no ingresa nada en el campo name debe aparecer el mensaje del nombre es un requisito
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Contador'),
        backgroundColor: Colors.deepPurple.withOpacity(0.8),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7B42F6), Color(0xFFB01EFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  key: const Key('nameField'),
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Contador: $_counter',
                key: const Key('counterText'),
                style: const TextStyle(fontSize: 28, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    key: const Key('incrementBtn'),
                    onPressed: _increment,
                    child: const Icon(Icons.add),
                  ),
                  ElevatedButton(
                    key: const Key('decrementBtn'),
                    onPressed: _decrement,
                    child: const Icon(Icons.remove),
                  ),
                  ElevatedButton(
                    key: const Key('resetBtn'),
                    onPressed: _reset,
                    child: const Icon(Icons.refresh),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                key: const Key('navigateBtn'),
                onPressed: _navigate,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Ir a Resultados'),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                key: const Key('goToListBtn'),
                onPressed: () {
                  Navigator.pushNamed(context, '/list');
                },
                icon: const Icon(Icons.list),
                label: const Text('Ir a Lista'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
