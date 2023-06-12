import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class Spalch_screen extends StatefulWidget{

  const Spalch_screen ({ Key? key}):super (key:key);

  @override
  State<Spalch_screen> createState() => _Spalch_screenState();
}

class _Spalch_screenState extends State<Spalch_screen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
          'https://upload.wikimedia.org/wikipedia/fr/thumb/5/52/Blason_%C3%A9toile_du_sahel.svg/1200px-Blason_%C3%A9toile_du_sahel.svg.png'),
      title: Text(
        "Welcome",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: '/slide',
      durationInSeconds: 3,
    );
  }
}