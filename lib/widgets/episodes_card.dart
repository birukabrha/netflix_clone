import 'package:flutter/material.dart';

class EpisodesCard extends StatelessWidget {
  const EpisodesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 170,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 55,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(.4),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      child: const Text(
                        '1. Welcome to the Playground',
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Text(
                      '43m',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.download,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 15,),
          const Text(
            'When a team of mercineries breaks into a wealthywealthywealthy family compound on Christmas Eve, taking everyone inside hostage, the team isn\'t prepared for a surprise)',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
