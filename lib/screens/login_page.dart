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
    return Stack(
      children: [
        Container(
          color: Colors.amberAccent,
          height: 400,
          width: MediaQuery.of(context).size.width,
        ),
        Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: false,
                backgroundColor: _visible?Colors.grey.withOpacity(.0):Colors.red,
              ),
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: false,
                floating: true,
                backgroundColor: Colors.green,
              ),
            ],
            body: NotificationListener<UserScrollNotification>(
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
              child: SizedBox(
                child: TextButton(
                  onPressed: () {
                    // ApiServices().coverPhoto();
                  },
                  child: ListView(
                    children: [
                      const Text(
                        'Test',
                      ),
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
