import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/config.dart';
import 'package:netflix_clone/screens/info_page.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/services/id_list.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: ApiServices().coverMovie(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            List<String> genreNames = [];
            for (var id in data['genre_ids']) {
              genreM.forEach((k, v) {
                if (id == v) {
                  genreNames.add(k);
                }
              });
            }
            var imageData = data!['backdrop_path'];
            String? finalImage = 'https://${Config.imageUrl}${imageData}';
            return Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 550,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(finalImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.5, -1),
                          end: Alignment(0.5, 1),
                          stops: [0.5, 1],
                          colors: <Color>[
                            Colors.transparent,
                            Colors.black,
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${data['name']}',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 25,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Text(
                                genreNames[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                  left: 5,
                                  right: 5,
                                ),
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              );
                            },
                            itemCount: genreNames.length,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'My List',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  minimumSize: const Size(100, 35),
                                  maximumSize: const Size(100, 35),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.play_arrow,
                                    ),
                                    Text(
                                      'Play',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.bottomSheet(
                                  InfoPage(movieData: data, isMovie: false,),
                                  isScrollControlled: true,
                                  isDismissible: true,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Info',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container(
              height: 550,
            );
          }
        } else {
          return Container(
            height: 550,
          );
        }
      },
    );
  }
}
