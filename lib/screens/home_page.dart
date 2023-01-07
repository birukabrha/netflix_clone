import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/config.dart';
import 'package:netflix_clone/controllers/navbar_controller.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/services/id_list.dart';
import 'package:netflix_clone/widgets/continue_watching_card.dart';
import 'package:netflix_clone/widgets/home_header.dart';
import 'package:netflix_clone/widgets/movie_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final NavBarController _controller = Get.put(NavBarController());
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
                ),MovieCard(
                  future: ApiServices().trendingM(true),
                  title: 'Trending',
                ),
                ContinueWatchingCard(
                    username: 'Biruk', future: ApiServices().trendingT(true)),
                MovieCard(
                  future: ApiServices().popular(false),
                  title: 'Popular TV Shows',
                ),
              ],
            ),
          ),
          Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: _controller.visible.value ? 140 : 110,
              child: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    elevation: 0,
                    pinned: true,
                    floating: false,
                    backgroundColor: _controller.visible.value
                        ? Colors.black.withOpacity(.0)
                        : Colors.black.withOpacity(.8),
                    leading: Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      child: Image.asset(
                        'assets/images/N_icon1.png',
                        fit: BoxFit.contain,
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
                          right: 5,
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
                      child: Container(
                        height: 35,
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'TV Shows',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Movie',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Categories',
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                body: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
