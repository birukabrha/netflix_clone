import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/app_bar.dart';
import 'package:netflix_clone/widgets/coming_soon.dart';
import 'package:netflix_clone/widgets/everyones_watching.dart';

class NewAndHot extends StatefulWidget {
  const NewAndHot({super.key});

  @override
  State<NewAndHot> createState() => _NewAndHotState();
}

class _NewAndHotState extends State<NewAndHot> {
  late ScrollController listController;
  final everyonesWatchingKey = GlobalKey();
  final comingSoonKey = GlobalKey();

  @override
  void initState() {
    listController = ScrollController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const MyAppBar(
        title: 'New & Hot',
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(right: 245),
                width: 30,
                height: 32,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.movie_sharp,
                      color: Colors.red,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Coming Soon',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  controller: listController,
                  itemBuilder: (context, index) {
                    return const ComingSoon();
                  },
                  itemCount: 5,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(right: 180),
                width: 180,
                height: 32,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.fire_extinguisher,
                      color: Colors.red,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Everyone\'s Watching',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  controller: listController,
                  itemBuilder: (context, index) {
                    return EveryonesWatching();
                  },
                  itemCount: 5,
                ),
              ),
            ],
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              color: Colors.black,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Scrollable.ensureVisible(
                      comingSoonKey.currentContext!,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 130,
                      height: 32,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.movie_sharp,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Coming Soon',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (everyonesWatchingKey.currentContext != null) {
                        Scrollable.ensureVisible(
                            everyonesWatchingKey.currentContext!);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 180,
                      height: 32,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.fire_extinguisher,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Everyone\'s Watching',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

