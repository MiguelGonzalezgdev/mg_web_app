import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mg WebApp',
      home: Scaffold(
        appBar: AppBar(title: const Text('Mg App Bar')),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
