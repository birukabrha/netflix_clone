import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/controllers/user_controller.dart';
import 'package:netflix_clone/list.dart';
import 'package:netflix_clone/screens/bottom_navbar.dart';
import 'package:netflix_clone/widgets/whos_watching_card.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left_outlined,
            size: 32,
          ),
        ),
        title: Obx(
          () => Text(
            _userController.selectedUser.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.black,
              height: 110,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: profileData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _userController.selectedUser.value =
                            profileData[index]['name'];
                        _userController.selectedUserProfile.value =
                            profileData[index]['profile'];
                        Get.offAll(() => BottomNavBar());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 3),
                        color: Colors.black,
                        padding: const EdgeInsets.all(10.0),
                        child: WhosWatchingCard(
                          isProfilePage: true,
                          name: profileData[index]['name'],
                          image: profileData[index]['profile'],
                          isLocked: profileData[index]['isLocked'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.edit_outlined,
                      color: Colors.grey,
                      size: 28,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Manage Profiles',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: profileOptions.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            bottom: 2,
                          ),
                          child: ListTile(
                            tileColor: Colors.grey.shade900,
                            leading: profileOptions[index]['leading'],
                            trailing: profileOptions[index]['trailing'],
                            title: Text(
                              profileOptions[index]['text'],
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Version: 15.14.0 (4223) 5.0.1-001',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
