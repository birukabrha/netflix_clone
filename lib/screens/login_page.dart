import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/config.dart';
import 'package:netflix_clone/services/api_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              setState(() {
                if (direction == ScrollDirection.reverse) {
                  _visible = false;
                } else if (direction == ScrollDirection.forward) {
                  _visible = true;
                }
              });
              return true;
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 0),
              children: [
                FutureBuilder<String?>(
                  future: ApiServices().coverPhoto(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        String? finalImage =
                            'https://${Config.imageUrl}${snapshot.data}';
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image(
                                image: NetworkImage(finalImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('Error fetching data');
                      }
                    } else {
                      return const Text('Error fetching data');
                    }
                  },
                ),FutureBuilder<String?>(
                  future: ApiServices().coverPhoto(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        String? finalImage =
                            'https://${Config.imageUrl}${snapshot.data}';
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image(
                                image: NetworkImage(finalImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('Error fetching data');
                      }
                    } else {
                      return const Text('Error fetching data');
                    }
                  },
                ),FutureBuilder<String?>(
                  future: ApiServices().coverPhoto(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        String? finalImage =
                            'https://${Config.imageUrl}${snapshot.data}';
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image(
                                image: NetworkImage(finalImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('Error fetching data');
                      }
                    } else {
                      return const Text('Error fetching data');
                    }
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: false,
                  backgroundColor:
                      _visible ? Colors.black.withOpacity(.0) : Colors.black.withOpacity(.8),
                  leading: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
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
                        top: 15,
                        bottom: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SliverAppBar(
                  toolbarHeight: 20,
                  collapsedHeight: 20,
                  expandedHeight: 20,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  pinned: false,
                  floating: true,
                  backgroundColor: Colors.green.shade200,
                ),
              ],
              body: Container(
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
