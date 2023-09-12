import 'package:flutter/material.dart';
import 'package:stage_one/home_page.dart';
import 'package:stage_one/web-view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(
          pageTitle: 'Stage Two Task',
        ));
  }
}
