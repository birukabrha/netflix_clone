import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/config.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/episodes_card.dart';
import 'package:netflix_clone/widgets/movie_card.dart';
import 'package:netflix_clone/widgets/trailers_card.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.movieData});

  final dynamic movieData;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    // print("movieData == $movieData");
    var imageData = widget.movieData['backdrop_path'].toString();
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  // shrinkWrap: true,
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
                    widget.movieData['title'] != null
                        ? Text(
                            widget.movieData['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          )
                        : Text(
                            widget.movieData['name'],
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
                          widget.movieData['release_date'] != null
                              ? Text(
                                  widget.movieData['release_date']
                                      .substring(0, 4),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              : widget.movieData['first_air_date'] != null
                                  ? Text(
                                      widget.movieData['first_air_date']
                                          .substring(0, 4),
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
                        print(widget.movieData['id']);
                        ApiServices().movieByID(widget.movieData['id']);
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
                      widget.movieData['overview'],
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
                        bottom: TabBar(
                          indicator: const UnderlineTabIndicator(
                            borderSide:
                                BorderSide(color: Colors.red, width: 3.0),
                            insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 12,
                          ),
                          tabs: const [
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
                          controller: tabController,
                          onTap: (int index) {
                            setState(() {
                              selectedIndex = index;
                              tabController.animateTo(index);
                            });
                          },
                          // indicator: ,
                        ),
                      ),
                    ),
                    IndexedStack(
                      index: selectedIndex,
                      children: [
                        Visibility(
                          maintainState: true,
                          visible: selectedIndex == 0,
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.movieData['title'] != null
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          top: 20,
                                        ),
                                        child: Text(
                                          widget.movieData['title'],
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          top: 20,
                                        ),
                                        child: Text(
                                          widget.movieData['name'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 2,
                                    itemBuilder: (context, index) {
                                      return const EpisodesCard();
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          maintainState: true,
                          visible: selectedIndex == 1,
                          child: Container(
                            height: 1000,
                            color: Colors.red,
                            child: const Center(
                              child: Text('Content 2'),
                            ),
                          ),
                        ),
                        Visibility(
                          maintainState: true,
                          visible: selectedIndex == 2,
                          child: Container(
                            color: Colors.blue,
                            // child: GridView.builder(
                            //   shrinkWrap: true,
                            //   gridDelegate:
                            //       SliverGridDelegateWithFixedCrossAxisCount(
                            //     crossAxisCount: 3,
                            //     mainAxisSpacing: 2,
                            //     mainAxisExtent: 1 / 2,
                            //   ),
                            //   itemBuilder: ((context, index) {
                            //     return MovieCard(
                            //         future: ApiServices().popular(true),
                            //         title: 'null');
                            //   }),
                            // ),
                          ),
                        ),
                        Visibility(
                          maintainState: true,
                          visible: selectedIndex == 3,
                          child: Container(
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return const TrailersCard();
                                }),
                          ),
                        ),
                      ],
                    )
                    // Expanded(
                    //   child: TabBarView(
                    //     children: [
                    //       Container(
                    //         color: Colors.blue,
                    //         child: ListView.builder(
                    //             itemCount: 4,
                    //             itemBuilder: (context, index) {
                    //               return Container(
                    //                 width: MediaQuery.of(context).size.width,
                    //                 height: 200,
                    //                 margin: const EdgeInsets.symmetric(vertical: 10),
                    //                 color: Colors.amber,
                    //               );
                    //             }),
                    //       ),
                    //       Container(
                    //         height: 100,
                    //         color: Colors.red,
                    //       ),
                    //       Container(
                    //         height: 50,
                    //         color: Colors.green,
                    //       ),
                    //       Container(
                    //         height: 400,
                    //         color: Colors.yellow,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
