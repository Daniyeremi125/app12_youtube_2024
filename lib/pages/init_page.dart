import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
        unselectedItemColor: Colors.white70,
        currentIndex:_currentIndex,
        onTap: (int value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: "Principal",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Shorts",
            icon: Icon(
              Icons.play_arrow,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              margin: EdgeInsets.only(top: 5),
              child: Icon(
                Icons.add_circle_outline_rounded,
                size: 35.0,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Suscripciones",
            icon: Icon(
              Icons.subscriptions_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(
              Icons.video_collection_rounded,
            ),
          ),
        ],
      ),
    );
  }
}