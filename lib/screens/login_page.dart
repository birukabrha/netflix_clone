import 'package:flutter/material.dart';
import 'package:netflix_clone/config.dart';
import 'package:netflix_clone/services/api_services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: TextButton(
          onPressed: () {
            ApiServices().coverPhoto();
          },
          child: ListView(
            children: [
              const Text(
                'Test',
              ),
              FutureBuilder<String?>(
                future: ApiServices().coverPhoto(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      String? finalImage = 'https://${Config.imageUrl}${snapshot.data}';
                      return Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image(image: NetworkImage(finalImage),fit: BoxFit.cover,),
                          ),
                        ],
                      );
                    } else {
                      return const Text('Error fetching data');
                    }
                  } else {
                    return const Text('Error fetching data');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
