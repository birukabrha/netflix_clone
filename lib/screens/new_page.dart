import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/app_bar.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:netflix_clone/widgets/coming_soon.dart';

class NewAndHot extends StatefulWidget {
  const NewAndHot({super.key});

  @override
  State<NewAndHot> createState() => _NewAndHotState();
}

class _NewAndHotState extends State<NewAndHot> {
  late ScrollController listController;

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
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    listController.animateTo(listController.offset - 200,
                        curve: Curves.linear,
                        duration: const Duration(milliseconds: 500));
                  },
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
                    listController.animateTo(listController.offset + 200,
                        curve: Curves.linear,
                        duration: const Duration(milliseconds: 500));
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
            SizedBox(
              // color: Colors.amber,
              height: MediaQuery.of(context).size.height - 225,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                controller: listController,
                itemBuilder: (context, index) {
                  return ComingSoon();
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: index == 0?200:500,
                  //   color: index == 0?Colors.redAccent:Colors.yellow,
                  // );
                },
                itemCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
