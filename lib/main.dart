
import 'package:app/article.dart';
import 'package:app/discoverNews.dart';
import 'package:app/home.dart';
import 'package:app/news.dart';
import 'package:app/search.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(showLogin: showLogin),
        '/intro': (context) => TestScreen(),
        '/login': (context) => LoginScreen(),
         '/home': (BuildContext context) => HomePage(),
        '/forgetPassword': (BuildContext context) => ForgotPasswordPage(),
        '/search': (BuildContext context) => SearchPage(),
        '/news': (context) => const NewsScreen(),
        '/discoverNews': (context) => const DiscoverScreen(),
       '/article': (context) => const ArticleScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => SplashScreen(showLogin: showLogin),
        );
      },
    );
  }
}