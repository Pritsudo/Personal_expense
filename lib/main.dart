import 'package:flutter/material.dart';
import 'package:personal_expense/Screens/CardScreen.dart';
import './Screens/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(239, 58, 216, 216)),
      home: const HomePage(),
      routes: {
        // HomePage.routeName:(context) => HomePage(),
        CardScreen.routeName:(context) => const CardScreen(),
      }
    );
  }
}
