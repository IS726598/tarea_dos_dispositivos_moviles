import 'package:flutter/material.dart';
import 'package:tarea_dos/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
      color: Colors.green[400],
      theme: ThemeData(
        accentColor: Colors.green[700],
        primaryColor: Colors.green[700],        
      ),
    );
  }
}

