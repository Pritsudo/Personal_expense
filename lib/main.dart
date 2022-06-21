import 'package:flutter/material.dart';
import 'package:personal_expense/Screens/expenses_screen.dart';
import 'package:personal_expense/providers/expense_provider.dart';
import './Screens/HomePage.dart';
import 'package:provider/provider.dart';

import 'Screens/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Expenses()),
      ],
      child: MaterialApp(
          title: 'Expense',
          theme: ThemeData(
              scaffoldBackgroundColor: const Color.fromARGB(239, 58, 216, 216)),
          home: StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return HomePage();
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return LoginScreen();
            },
            stream: FirebaseAuth.instance.authStateChanges(),
          ),
          routes: {
            HomePage.routeName: (context) => HomePage(),
            CardScreen.routeName: (context) => const CardScreen(),
          }),
    );
  }
}
