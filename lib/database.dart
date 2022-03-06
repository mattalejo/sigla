// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({Key? key}) : super(key: key);

  @override
  DatabaseScreenState createState() {
    return DatabaseScreenState();
  }
}

class DatabaseScreenState extends State<DatabaseScreen> {
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

void foodData(BuildContext context) async {
  var db = await openDatabase('data.db');
  await db.execute('FROM');
}

Widget _buildList() {
  return ListView.builder(
      addAutomaticKeepAlives: false,
      shrinkWrap: true,
      itemBuilder: (_, i) => Container(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            margin: EdgeInsets.symmetric(vertical: 8),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(width: 1.0, color: Colors.grey)),
              onPressed: () {},
              child: foodInfo(),
            ),
          ));
}

class Food {
  int id;
  String name;
  int servingSize;
  String servingMeasurement;
  String foodType;
  double calories;
  double carbs;
  double protein;
  double fat;
  double price;
  Food(
      this.id,
      this.name,
      this.servingSize,
      this.servingMeasurement,
      this.foodType,
      this.calories,
      this.carbs,
      this.protein,
      this.fat,
      this.price);
  @override
  String toString() {
    return '{ ${this.id}, ${this.name}, ${this.servingSize}, ${this.servingMeasurement}, ${this.foodType}, ${this.calories}, ${this.carbs}, ${this.protein}, ${this.fat}, ${price}}';
  }
}

class foodInfo extends StatelessWidget {
  const foodInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        const Text("Kangkong",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            )),
        const SizedBox(height: 8),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [foodColumn(), foodNutrition()],
        ),
      ],
    ));
  }
}

TableRow foodNutrition() {
  return const TableRow(children: [
    Center(
        child: Text("10.7	kcal",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ))),
    Center(
        child: Text("1.75	g",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ))),
    Center(
        child: Text("1.46	g",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ))),
    Center(
        child: Text("0.112 g",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ))),
    Center(
        child: Text("P 1.35",
            style: TextStyle(
              color: Colors.black,
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
