// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:sqflite/sqflite.dart';

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
            appBar: const TabBar(
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Color.fromARGB(255, 251, 129, 111),
              ),
              tabs: <Widget>[
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
            body: Container(
              margin: const EdgeInsets.only(
                top: 4,
              ),
              child: TabBarView(
                children: <Widget>[
                  _buildList(),
                  _buildList(),
                  _buildList(),
                  _buildList(),
                ],
              ),
            )));
  }
}

Widget _buildList() {
  return ListView.builder(
      addAutomaticKeepAlives: false,
      shrinkWrap: true,
      itemBuilder: (_, i) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8, top: 8),
          child: Container(
              child: Column(
            children: [
              const Text("Kangkong",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [foodColumn(), foodData()],
              ),
            ],
          ))));
}

TableRow foodData() {
  return const TableRow(children: [
    Center(
        child: Text("10.7	kcal",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ))),
    Center(
        child: Text("1.75	g",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ))),
    Center(
        child: Text("1.46	g",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ))),
    Center(
        child: Text("0.112 g",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ))),
    Center(
        child: Text("P 1.35",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ))),
  ]);
}

TableRow foodColumn() {
  return const TableRow(children: [
    Center(
        child: Text(
      "Calories",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    )),
    Center(
      child: Text("Carbs",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          )),
    ),
    Center(
      child: Text("Protein",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          )),
    ),
    Center(
      child: Text("Fat",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          )),
    ),
    Center(
      child: Text("Price",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          )),
    )
  ]);
}
