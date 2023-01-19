import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/controllers/user_controller.dart';

class WhosWatchingCard extends StatelessWidget {
  const WhosWatchingCard({
    super.key,
    required this.name,
    required this.image,
    required this.isLocked,
    required this.isProfilePage,
  });

  final String name;
  final String image;
  final bool isLocked;
  final bool isProfilePage;

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();

    return isProfilePage
        ? SizedBox(
            // height: 115,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(image),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: userController.selectedUser.value == name
                        ? Colors.white
                        : Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                isLocked
                    ? SizedBox(
                        height: 5,
                        child: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                          size: isProfilePage ? 18 : 24,
                        ),
                      )
                    : Container(
                        height: 5,
                      )
              ],
            ),
          )
        : SizedBox(
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(image),
                  ),
                ),
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                isLocked
                    ? const SizedBox(
                        height: 15,
                        child: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                      )
                    : Container(
                        height: 15,
                      )
              ],
            ),
          );
  }
}
