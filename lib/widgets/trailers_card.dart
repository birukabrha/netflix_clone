import 'package:flutter/material.dart';

class TrailersCard extends StatelessWidget {
  const TrailersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              ),
              Positioned(
                top: 85,
                left: MediaQuery.of(context).size.width/2 - 45/1.8,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(.7),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'Season 1 Teaser Trailer',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
