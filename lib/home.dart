import 'package:app/news.dart';
import 'package:app/search.dart';
import 'package:app/tachkila.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {    // SingleTickerProviderStateMixin used for animation controller
  late AnimationController _controller;  // Declaring an AnimationController variable _controller for managing the image animation.
  final List<String> images = [  // Defining a list of image paths.
    'images/ess.png',
    'images/news1.jpg',
    'images/players.jpg',
    'images/players.jpg',
    'images/players.jpg',
  ];
  int _currentIndex = 0; // Initializing a variable _currentIndex to keep track of the current image index.



  @override
  void initState() { // The initState() method is called when the state object is inserted into the tree. It initializes the animation controller _controller with a duration of 5 seconds and sets vsync to this for handling animations.
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _controller.addStatusListener((status) { // Adding a status listener to the animation controller. When the animation completes, it updates the _currentIndex to the next image index and reverses the animation. When the animation is dismissed, it forwards the animation again.
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % images.length;
        });
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward(); // Starting the animation by calling forward() on the animation controller.
  }

  @override
  void dispose() { // The dispose() method is called when the state object is removed from the tree. It disposes of the animation controller to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 128, 9, 9), // Set the background color to dark red
        selectedItemColor: Colors.white, // Set the selected item color
        unselectedItemColor: Colors.white70, // Set the unselected item color
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            openSearchPage(context);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 128, 6, 6),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('News'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewsScreen()),
                );
              },
            ),
            ListTile(
              title: Text('tachkila'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TachkilaPage()),
                );
              },
            ),
            ListTile(
              title: Text('shop'),
              onTap: () {
                // Action for menu item 3
              },
            ),
            ListTile(
              title: Text('tickets'),
              onTap: () {
                // Action for menu item 3
              },
            ),
            ListTile(
              title: Text('groupe'),
              onTap: () {
                // Action for menu item 3
              },
            ),
            ListTile(
              title: Text('jeux'),
              onTap: () {
                // Action for menu item 3
              },
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              Container(
                width: constraints.maxWidth,
                height: 200,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                    );
                  },
                  child: Image.asset(
                    images[_currentIndex],
                    key: ValueKey<int>(_currentIndex),
                    fit: BoxFit.cover,
                    width: constraints.maxWidth,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Welcome to the Home Page!',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void openSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage()),
    );
  }
}
