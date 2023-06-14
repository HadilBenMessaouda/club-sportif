import 'package:app/splash_screen.dart';
import 'package:app/into_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/forgotpass.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showlogin = prefs.getBool('showlogin') ?? false;
  runApp(MyApp(showLogin: showlogin));
}

class MyApp extends StatelessWidget {
  final bool showLogin;

  const MyApp({
    Key? key,
    required this.showLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(showLogin: showLogin),
        '/intro': (context) => TestScreen(),
        '/login': (context) => LoginScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => SplashScreen(showLogin: showLogin),
        );
      },
    );
  }
}
