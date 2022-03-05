import 'package:flutter/material.dart';
import 'form.dart';
import 'home.dart';
import 'database.dart';

class Directory extends StatefulWidget{
  const Directory({Key? key}): super(key: key);

  @override
  DirectoryState createState() {
    return DirectoryState();
  }
}

class DirectoryState extends State<Directory> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("asd")),
      body: PageView(
        controller: pageController,
        children: [
          HomeScreen(),
          MyCustomForm(),
          DatabaseScreen()
        ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Health"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Food Database"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 30, 92, 6),
        unselectedItemColor: Colors.grey,
        onTap: onTapped
      ),
    );

  }
}