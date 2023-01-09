import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/app_bar.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppBar(title: 'New & Hot',),
    );
  }
}
