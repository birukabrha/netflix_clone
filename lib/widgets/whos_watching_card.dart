import 'package:flutter/material.dart';

class WhosWatchingCard extends StatelessWidget {
  const WhosWatchingCard(
      {super.key,
      required this.name,
      required this.image,
      required this.isLocked});

  final String name;
  final String image;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(image),
            ),
          ),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          isLocked
              ? const SizedBox(
                  height: 15,
                  child: Icon(
                    Icons.lock_outline,
                    color: Colors.white,
                  ),
                )
              : Container(
                  height: 15,
                )
        ],
      ),
    );
  }
}
