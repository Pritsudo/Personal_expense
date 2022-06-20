import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color.fromARGB(239, 58, 216, 216)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor: Colors.transparent,
        appBar: AppBar(
        title: Text('Personal Expensis'),

      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green,
        ),
      ),
      ),
    );
  }
}
