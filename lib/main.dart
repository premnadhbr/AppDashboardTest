import 'package:flutter/material.dart';
import 'app/view/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(24, 24, 24, 1.0),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(31, 29, 34, 1.0), // AppBar background
        ),
      ),
    );
  }
}
