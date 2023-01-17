import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/controllers/category_controller.dart';
import 'package:netflix_clone/services/category_list.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({
    super.key,
    required this.isMain,
    required this.isMovie,
    required this.isTv,
  });

  final bool isMain;
  final bool isMovie;
  final bool isTv;

  CategoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.1),
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          padding: const EdgeInsets.only(top: 80, bottom: 10),
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: isMain
                  ? mainCategoryList.length
                  : isMovie
                      ? movieCategoryList.length
                      : isTv
                          ? tvCategoryList.length
                          : categoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextButton(
                    onPressed: () {
                      isMain
                          ? controller.selectedNavBar.value =
                              mainCategoryList[index]
                          : isMovie
                              ? controller.selectedMovie.value =
                                  movieCategoryList[index]
                              : isTv
                                  ? controller.selectedTv.value =
                                      tvCategoryList[index]
                                  : controller.category.value =
                                      categoryList[index];

                      Get.back();
                    },
                    child: isMain
                        ? Text(
                            mainCategoryList[index],
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        : isMovie
                            ? Text(
                                movieCategoryList[index],
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            : isTv
                                ? Text(
                                    tvCategoryList[index],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  )
                                : Text(
                                    categoryList[index],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Get.back()),
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        child: const Icon(
          Icons.close,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
