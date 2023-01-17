import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/controllers/appbar_controller.dart';
import 'package:netflix_clone/controllers/category_controller.dart';
import 'package:netflix_clone/screens/downloads_page.dart';
import 'package:netflix_clone/screens/home_page.dart';
import 'package:netflix_clone/screens/new_page.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});
  final AppBarController _controller = Get.put(AppBarController());
  final CategoryController _categoryController = Get.put(CategoryController());

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomePage(),
          NewAndHot(),
          Container(),
          DownloadPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        iconSize: 25,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: 'New & Hot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions),
            label: 'Fast Laughs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_rounded),
            label: 'Downloads',
          ),
        ],
      ),
    );
  }
}
