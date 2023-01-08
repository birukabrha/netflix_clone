import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/config.dart';

class ContinueWatchingCard extends StatelessWidget {
  const ContinueWatchingCard({
    Key? key,
    required this.username,
    required this.future,
  }) : super(key: key);

  final String username;
  final Future future;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5, left: 8),
          child: Text(
            'Continue Watching for $username',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        FutureBuilder<dynamic>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.done) {
                var data = snapshot.data;
                Random random = Random();

                return SizedBox(
                  height: 175,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        var imageData = data[index]['backdrop_path'];
                        int randomN = random.nextInt(99);
                        var image = 'https://${Config.imageUrl}${imageData}';
                        bool isNew = false;
                        if (index == 7) {
                          isNew = true;
                        }
                        return Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 0),
                                  width: 100,
                                  height: 140,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    child: Image(
                                      image: NetworkImage(image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 0),
                                    height: 3.5,
                                    width: randomN.toDouble(),
                                    color: Colors.red,
                                    //   child: LinearProgressIndicator(
                                    //     value:.6,
                                    //   minHeight: 3.5,
                                    // ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 0),
                                  padding:
                                      const EdgeInsets.only(left: 7,right: 5,bottom: 2),
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Icon(Icons.info_outline,
                                          color: Colors.grey),
                                      Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 40,
                              left: 28,
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.black12.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                            isNew
                                ? Positioned(
                                    bottom: 35,
                                    left: 15,
                                    child: Container(
                                      width: 70,
                                      height: 18,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                            5,
                                          ),
                                          topLeft: Radius.circular(
                                            5,
                                          ),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'New Season',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        );
                      }),
                );
              } else {
                return Container(
                  height: 175,
                );
              }
            } else {
              return Container(
                height: 175,
              );
            }
          },
        ),
      ],
    );
  }
}
