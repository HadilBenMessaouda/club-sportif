import 'package:app/login.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late Material materialButton;
  late int index;
  int currentIndex = 0;
  late PageController _pageController;
  
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0,
                vertical:90.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'News of your favorite club',
                    style: pageTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  //vertical: 130.0,
                ),
                child: Image.asset('images/news1.jpg', height: 200, width: 200),
              ),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Keep your self close to your club by watching their news regularly',
                    style: pageInfoStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0,
                vertical:110.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'CHANGE AND RISE',
                    style: pageTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  //vertical: 130.0,
                ),
                child: Image.asset('images/players.jpg',height: 200,width: 200),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, 
                vertical: 20.0
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'your best player',
                    style: pageInfoStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),



PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0,
                vertical: 100.0,),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'STREAMING LIVE ',
                    style: pageTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                //vertical: 130.0,
                ),
                child: Image.asset('images/live.png', height: 200,width: 200),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, 
                vertical: 20.0
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('You can watch your match in streaming live with high quality'
                    ,
                    style: pageInfoStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),


    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
             const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0,
                vertical: 110.0,),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Tachkila',
                    style: pageTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 20.0,
                ),
                child: Image.asset('images/tachkila.jpg', height: 200,width: 200),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('you can form your own team'
                    ,
                    style: pageInfoStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      color: Colors.red,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        onTap: () {
          if (setIndex != null) {
            index = 3;
            setIndex(3);
          }
        },
        child: const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 17.0, vertical: 5.0),
          child: Text(
            ' SKIP ',
            style: TextStyle(color: Colors.white, letterSpacing: 1.0),
          ),
        ),
      ),
    );
  }

  Material get _signinButton {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      color: Colors.red,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        onTap: () async {
          final prefs =await SharedPreferences.getInstance();
          prefs.setBool('showlogin',true);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 5.0),
          child: Text(
            ' SIGN IN ',
            style: TextStyle(color: Colors.white, letterSpacing: 1.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.0,
                  color: Colors.white,
                ),
              ),
              child: ColoredBox(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
      indicatorDesign: IndicatorDesign.polygon(
        polygonDesign: PolygonDesign(
          polygon: DesignType.polygon_diamond,
          
        ),
      ),
      activeIndicator : ActiveIndicator(color: Color.fromARGB(255, 220, 32, 32), borderWidth: 0.7),
       closedIndicator : ClosedIndicator(color: Color.fromARGB(255, 220, 32, 32), borderWidth: 0.7),
    )
                      ),
                      index == pagesLength - 1
                          ? _signinButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
