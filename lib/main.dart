import 'package:flutter/material.dart';
import "directory.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
        theme: ThemeData(
            accentColor: Color.fromARGB(255, 60, 89, 126),
            visualDensity: VisualDensity(horizontal: 0.6, vertical: 0.4)),
        home: Directory());
  }
}
