import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'result_page.dart';
import 'list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Test App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white.withOpacity(0.95),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple.shade300.withOpacity(0.85),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ),
      home: const CounterPage(),
      routes: {
        '/result': (context) => const ResultPage(),
        '/list': (context) => const ListPage(),
      },
    );
  }
}
