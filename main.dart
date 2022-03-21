import 'package:flutter/material.dart';
import 'package:sga/menu.dart';
import 'package:sga/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeGame Academy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Menu(),
    );
  }
}

