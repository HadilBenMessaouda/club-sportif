import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:app/into_screen.dart';
import 'package:app/login.dart';

class SplashScreen extends StatefulWidget {
  final bool showLogin;

  const SplashScreen({Key? key, required this.showLogin}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));

    String nextRoute = '/intro'; // Par défaut, redirige vers l'IntroScreen

    if (widget.showLogin) {
      nextRoute =
          '/login'; // Si showLogin est vrai, redirige vers le LoginScreen
    }

    Navigator.pushReplacementNamed(context, nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
          'https://upload.wikimedia.org/wikipedia/fr/thumb/5/52/Blason_%C3%A9toile_du_sahel.svg/1200px-Blason_%C3%A9toile_du_sahel.svg.png'),
      title: Text(
        "ESS club",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      showLoader: true,
      loadingText: Text("Loading..."),
      durationInSeconds: 3,
    );
  }
}
