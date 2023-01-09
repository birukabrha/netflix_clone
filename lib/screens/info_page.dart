import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/config.dart';
import 'package:netflix_clone/services/api_services.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key, required this.movieData});

  final dynamic movieData;

  @override
  Widget build(BuildContext context) {
    // print("movieData == $movieData");
    var imageData = movieData['backdrop_path'].toString();
    var image = 'https://${Config.imageUrl}${imageData}';
    return DefaultTabController(
      length: 4,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .95,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  child: SizedBox(
                    width: 70,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Icons.cast,
                            color: Colors.white,
                            size: 16,
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
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Preview',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Icons.volume_mute,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 27.5,
                  top: 100 - 27.5,
                  child: Center(
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(.4),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.red, width: 2.5),
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          right: 2,
                        ),
                        child: Image.asset(
                          'assets/images/N_icon1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        'SERIES',
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  movieData['title'] != null
                      ? Text(
                          movieData['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        )
                      : Text(
                          movieData['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        movieData['release_date'] != null
                            ? Text(
                                movieData['release_date'].substring(0, 4),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            : movieData['first_air_date'] != null
                                ? Text(
                                    movieData['first_air_date'].substring(0, 4),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(),
                        Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 13,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Text(
                            '18+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 15,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Text(
                            'HD',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.comment,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(movieData['id']);
                      ApiServices().movieByID(movieData['id']);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.play_arrow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Play',
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800,
                      foregroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.download,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Download',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    movieData['overview'],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Cast: ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Director: ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, left: 10, right: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'My List',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Rate',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.send_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Share',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      bottom: const TabBar(
                        tabs: [
                          Tab(
                            text: 'Episodes',
                          ),
                          Tab(
                            text: 'Collection',
                          ),
                          Tab(
                            text: 'More Like This',
                          ),
                          Tab(
                            text: 'Trailers & More',
                          ),
                        ],
                        // indicator: ,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    child: TabBarView(
                      
                      children: [
                        Container(
height: 200,
                          color: Colors.blue,
                        ),
                        Container(
                          height: 100,
                          color: Colors.red,
                        ),
                        Container(
                          height: 50,
                          color: Colors.green,
                        ),
                        Container(
                          height: 400,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
