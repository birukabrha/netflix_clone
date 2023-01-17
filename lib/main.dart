import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/screens/bottom_navbar.dart';
import 'package:netflix_clone/screens/whos_watching.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix Clone',
      home: WhosWatching(),
    );
  }
}
