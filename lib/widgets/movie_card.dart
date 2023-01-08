import 'package:flutter/material.dart';
import 'package:netflix_clone/config.dart';
import 'package:netflix_clone/services/api_services.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.future, required this.title})
      : super(key: key);

  final Future future;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5, left: 8),
          child: Text(
            title,
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
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        var imageData = data[index]['backdrop_path'].toString();
                        var image = 'https://${Config.imageUrl}${imageData}';
                        bool isNew = false;
                        if (index == 7) {
                          isNew = true;
                        }
                        return imageData == "null"
                            ?Container() :Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    width: 100,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: imageData == null
                                        ? Center(
                                            child: Text(
                                              data[index]['title'],
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image(
                                              image: NetworkImage(image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                                  isNew
                                      ? Positioned(
                                          bottom: 5,
                                          left: 20,
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                  height: 150,
                );
              }
            } else {
              return Container(
                height: 150,
              );
            }
          },
        ),
      ],
    );
  }
}
