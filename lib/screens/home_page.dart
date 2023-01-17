import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/controllers/appbar_controller.dart';
import 'package:netflix_clone/controllers/category_controller.dart';
import 'package:netflix_clone/screens/bottom_navbar.dart';
import 'package:netflix_clone/screens/catergory_page.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/continue_watching_card.dart';
import 'package:netflix_clone/widgets/games_card.dart';
import 'package:netflix_clone/widgets/home_header.dart';
import 'package:netflix_clone/widgets/movie_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AppBarController _controller = Get.find();
  final CategoryController _catController = Get.find();

  final String argument = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                _controller.visible.value = false;
              } else if (direction == ScrollDirection.forward) {
                _controller.visible.value = true;
              }
              return true;
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 0, bottom: 20),
              children: [
                HomeHeader(),
                MovieCard(
                  future: ApiServices().popular(true),
                  title: 'Popular on Netflix',
                  isMovie: true,
                ),
                // GamesCard(),
                MovieCard(
                  future: ApiServices().trendingM(true),
                  title: 'Trending',
                  isMovie: true,
                ),
                ContinueWatchingCard(
                    username: argument, future: ApiServices().trendingT(true)),
                MovieCard(
                  future: ApiServices().popular(false),
                  title: 'Popular TV Shows',
                  isMovie: false,
                ),
              ],
            ),
          ),
          Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: _controller.visible.value ? 140 : 110,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: _controller.visible.value
                      ? ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0)
                      : ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  blendMode: BlendMode.srcOver,
                  child: NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                        elevation: 0,
                        pinned: true,
                        floating: false,
                        backgroundColor: Colors.transparent,
                        leading: Container(
                          margin: const EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                          ),
                          child: GestureDetector(
                            onTap: () => Get.offAll(() => BottomNavBar(), arguments: argument[0]),
                            child: Image.asset(
                              'assets/images/N_icon1.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.cast),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                          Container(
                            width: 30,
                            height: 20,
                            margin: const EdgeInsets.only(
                              right: 15,
                              left: 5,
                              top: 15,
                              bottom: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.green,
                            ),
                          ),
                        ],
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(35),
                          child: Obx(() {
                            if (_catController.category.value == "Home" &&
                                _catController.selectedNavBar.value == "Home") {
                              return Container(
                                height: 35,
                                margin: const EdgeInsets.all(0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        _catController.selectedNavBar.value =
                                            "TV Shows";
                                      },
                                      child: const Text(
                                        'TV Shows',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _catController.selectedNavBar.value =
                                            "Movies";
                                      },
                                      child: const Text(
                                        'Movies',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Get.bottomSheet(
                                        CategoryPage(
                                          isMain: false,
                                          isMovie: false,
                                          isTv: false,
                                        ),
                                        isScrollControlled: true,
                                        isDismissible: true,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Categories',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 17,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            // else if (_catController.category.value !=
                            //     "Home" && _catController.selectedNavBar.value ==
                            //     "Home") {

                            // }
                            else if (_catController.selectedNavBar.value ==
                                "TV Shows") {
                              return Container(
                                height: 35,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () => Get.bottomSheet(
                                        CategoryPage(
                                          isMain: true,
                                          isMovie: false,
                                          isTv: true,
                                        ),
                                        isScrollControlled: true,
                                        isDismissible: true,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "TV Shows",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 17,
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Get.bottomSheet(
                                        CategoryPage(
                                          isMain: false,
                                          isMovie: false,
                                          isTv: true,
                                        ),
                                        isScrollControlled: true,
                                        isDismissible: true,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _catController.selectedTv.value,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 17,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (_catController.selectedNavBar.value ==
                                "Movies") {
                              return Container(
                                height: 35,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () => Get.bottomSheet(
                                        CategoryPage(
                                          isMain: true,
                                          isMovie: true,
                                          isTv: false,
                                        ),
                                        isScrollControlled: true,
                                        isDismissible: true,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Movies",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 17,
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Get.bottomSheet(
                                        CategoryPage(
                                          isMain: false,
                                          isMovie: true,
                                          isTv: false,
                                        ),
                                        isScrollControlled: true,
                                        isDismissible: true,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _catController.selectedMovie.value,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 17,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                height: 35,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () => Get.bottomSheet(
                                        CategoryPage(
                                          isMain: false,
                                          isMovie: false,
                                          isTv: false,
                                        ),
                                        isScrollControlled: true,
                                        isDismissible: true,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _catController.category.value,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 17,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }),
                        ),
                      ),
                    ],
                    body: Container(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
