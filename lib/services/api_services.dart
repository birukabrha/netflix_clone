import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/config.dart';

class ApiServices{
  dynamic fetchMovies() async{
    var url = Uri.https(Config.apiUrl, Config.genreM, {'api_key':Config.apiKey});

    final response = await http.get(url);
    
    final parsedJson = jsonDecode(response.body);
    // print(parsedJson['genres']);
    // print(parsedJson['genres'].length);
  } 

  Future<String> coverPhoto() async {
    var url = Uri.https(Config.apiUrl, Config.discoverT,{'api_key':Config.apiKey,'with_networks':'213'});
    
    final response = await http.get(url);

    final parsedJson = jsonDecode(response.body);
    Random random = Random();
    int randomNum = random.nextInt(parsedJson['results'].length-1);
    print(parsedJson['results'][randomNum]['backdrop_path']);

    return parsedJson['results'][randomNum]['backdrop_path'];
  }
}