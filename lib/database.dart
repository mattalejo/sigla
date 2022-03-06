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
    return DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: TabBar(
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: const Color.fromARGB(255, 251, 129, 111),
            ),
            tabs: const <Widget>[
              Tab(
                text: "Proteins",
              ),
              Tab(
                text: "Fats/Oils",
              ),
              Tab(
                text: "Carbs",
              ),
              Tab(
                text: "Fruits/Veg",
              )
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              Center(child: Icon(Icons.set_meal)),
              Center(child: Icon(Icons.water_drop)),
              Center(
                child: Icon(Icons.rice_bowl),
              ),
              Center(
                child: Icon(Icons.grass),
              )
            ],
          ),
        ));
  }
}
