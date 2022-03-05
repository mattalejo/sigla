import 'package:flutter/material.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({Key? key}) : super(key: key);

  @override
  DatabaseScreenState createState() {
    return DatabaseScreenState();
  }
}

class DatabaseScreenState extends State<DatabaseScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Insert directory page',
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }
}
