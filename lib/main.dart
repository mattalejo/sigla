import 'package:flutter/material.dart';
import "directory.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: "Open",
            visualDensity: const VisualDensity(horizontal: 0.6, vertical: 0.4),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color.fromARGB(255, 60, 89, 126))),
        home: Directory());
  }
}
