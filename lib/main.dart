import 'package:app/into_screen.dart';
import 'package:app/login.dart';
import 'package:app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'forgotpass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
MyApp({Key? key}) : super (key:key);
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
     // home: LoginScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Spalch_screen(),
         '/slide': (context) =>  TestScreen(),
        '/login': (BuildContext context) => const LoginScreen(),
        '/forgotPass' :(BuildContext context) => ForgotPasswordPage(),
      },
    );
  }
}
