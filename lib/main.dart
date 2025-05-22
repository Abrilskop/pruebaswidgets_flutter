import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Test App',
      home: const CounterPage(),
      routes: {
        '/result': (context) => const ResultPage(),
      },
    );
  }
}
