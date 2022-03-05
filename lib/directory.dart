import 'package:flutter/material.dart';
import 'form.dart';
import 'home.dart';
import 'database.dart';

class Directory extends StatefulWidget {
  const Directory({Key? key}) : super(key: key);

  @override
  DirectoryState createState() {
    return DirectoryState();
  }
}

class DirectoryState extends State<Directory> {
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
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Sigla",
            style: TextStyle(
                color: Color.fromARGB(255, 60, 89, 126),
                fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.transparent,
          shape: const Border(
            bottom: BorderSide(color: Colors.grey, width: 1),
          ),
          elevation: 0,
        ),
        body: PageView(
          controller: pageController,
          children: [HomeScreen(), MyCustomForm(), DatabaseScreen()],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(top: BorderSide(color: Colors.grey, width: 1))),
          child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calculate), label: "Health"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book), label: "Food Database"),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: const Color.fromARGB(255, 251, 129, 111),
              unselectedItemColor: Colors.grey,
              onTap: onTapped),
        ));
  }
}
