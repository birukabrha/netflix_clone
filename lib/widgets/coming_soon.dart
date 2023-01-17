import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> genreNames = [
      'Slick',
      'Psychological',
      'Thriller',
      'Love & Obsession'
    ];

    return Container(
      height: 425,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // color: Colors.blueGrey,
            height: 400,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  'FEB',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                Text(
                  '09',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 19),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
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
                            color: Colors.blueAccent,
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
                            'YOU',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Column(
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
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        Column(
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
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Pt. 1 Coming February 9; Pt. 2 Coming March 9',
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
                      'YOU',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      width: double.infinity,
                      // color: Colors.redAccent,
                      child: Text(
                        'Description Place Holder',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
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
            ],
          ),
        ],
      ),
    );
  }
}
