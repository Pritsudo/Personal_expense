import 'package:flutter/material.dart';
import 'package:personal_expense/Screens/CardScreen.dart';
import './Screens/HomePage.dart';
import 'Screens/LoginPage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MyApp());
  Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expense',
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(239, 58, 216, 216)),
        home: LoginScreen(),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          CardScreen.routeName: (context) => const CardScreen(),
        });
  }
}
