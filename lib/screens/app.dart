import 'package:flutter/material.dart';
import 'package:musicplayer2/screens/library.dart';
import 'package:musicplayer2/screens/home.dart';
import 'package:musicplayer2/screens/search.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> tabs = [MyHome(), Search(), Library()];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: (currentIndex) {
          setState(() {
            currentTabIndex = currentIndex;
          });
        },
        backgroundColor: Colors.black54,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 156, 156, 156),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Library",
          ),
        ],
      ),
    );
  }
}
