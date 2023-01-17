import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/list.dart';

class MoreButtomSheet extends StatelessWidget {
  const MoreButtomSheet({
    super.key,
    required this.movieData,
  });

  final dynamic movieData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                movieData['name'],
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey.shade400,
                ),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: moreData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.only(left: 0),
                  minLeadingWidth: 10,
                  leading: moreData[index]['icon'],
                  title: Text(
                    moreData[index]['title'],
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
