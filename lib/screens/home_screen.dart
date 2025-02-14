import 'package:flutter/material.dart';
import 'package:tabbar/model/screens/watchlist_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // Default tab index  
  int _currentIndex = 0;

  // Tab content widgets  
  static final List<Widget> _iconOption = <Widget>[
    WatchlistScreen(),  // Watchlist screen

    //other bottom Notification
    Center(
      child: Text(
        "Orders",
        style: TextStyle(fontSize: 20),
      ),
    ),
    Center(
      child: Text(
        "Portfolio",
        style: TextStyle(fontSize: 20),
      ),
    ),
    Center(
      child: Text(
        "Movers",
        style: TextStyle(fontSize: 20),
      ),
    ),
    Center(
      child: Text(
        "More",
        style: TextStyle(fontSize: 20),
      ),
    ),
  ];

  // Update selected index  
  void _onIconClicked(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _iconOption[_currentIndex]), // Wrap with SafeArea

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.white60,
        currentIndex: _currentIndex, // Tracks the selected tab
        onTap: _onIconClicked,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Watchlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Orders"),
          BottomNavigationBarItem(
              icon: Icon(Icons.work_outline), label: "Portfolio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined), label: "Movers"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }
}
