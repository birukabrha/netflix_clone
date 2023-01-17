import 'package:flutter/material.dart';

class EveryonesWatching extends StatelessWidget {
  EveryonesWatching({super.key});

List<String> genreNames = ['Slick','Psychological','Thriller','Love & Obsession'];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 425,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        // height: 190,
        width: MediaQuery.of(context).size.width - 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  right: 15,
                  bottom: 15,
                  child: Container(
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
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    alignment: Alignment.center,
                    width: 22,
                    height: 15,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Text(
                      '18+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'Vikings: Valhalla',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Remind Me',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Info',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Play',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Watch Season 1 Now',
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
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
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Text(
              'Vikings: Valhalla',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 5,bottom: 5,),
              width: double.infinity,
              // color: Colors.redAccent,
              child: Text(
                'A century after "Vikings", a new generation of heroes and kings seizes its destint in a society now divided between old gods and a new religion.',
                maxLines: 3,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade200,
                ),
              ),
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
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                              top: 5,
                              bottom: 16,
                              left: 5,
                              right: 5,
                            ),
                            width: 3,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          );
                        },
                        itemCount: genreNames.length,
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}