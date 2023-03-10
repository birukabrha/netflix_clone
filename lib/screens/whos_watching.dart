import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/controllers/user_controller.dart';
import 'package:netflix_clone/list.dart';
import 'package:netflix_clone/screens/bottom_navbar.dart';
import 'package:netflix_clone/widgets/whos_watching_card.dart';

class WhosWatching extends StatelessWidget {
  WhosWatching({super.key});

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Who\'s Watching?',
        ),
        titleTextStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w300,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Edit',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 80, 30, 30),
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 160,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (() {
                  userController.selectedUser.value =
                      profileData[index]['name'];
                      userController.selectedUserProfile.value =
                      profileData[index]['profile'];
                  Get.offAll(
                    () => BottomNavBar(),
                  );
                }),
                child: WhosWatchingCard(
                  isProfilePage: false,
                  name: profileData[index]['name'],
                  image: profileData[index]['profile'],
                  isLocked: profileData[index]['isLocked'],
                ),
              );
            },
            itemCount: profileData.length,
          ),
        ),
      ),
    );
  }
}
