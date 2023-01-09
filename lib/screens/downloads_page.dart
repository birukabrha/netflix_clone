import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/app_bar.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppBar(title: 'Downloads',),
    );
  }
}
