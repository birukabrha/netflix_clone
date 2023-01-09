import 'package:flutter/material.dart';

class GamesCard extends StatelessWidget {
  const GamesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10),
      height: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red.shade700, Colors.black],
          begin: const Alignment(-1, -1),
          end: const Alignment(-0.1, -0.8),
        ),
      ),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: 50,
            height: 50,
            color: Colors.amber,
          );
        },
      ),
    );
  }
}
