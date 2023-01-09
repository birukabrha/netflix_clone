import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/config.dart';

class ApiServices {
  Future<dynamic> coverMovie() async {
    var url = Uri.https(Config.apiUrl, Config.discoverT,
        {'api_key': Config.apiKey, 'with_networks': '213'});

    final response = await http.get(url);

    final parsedJson = jsonDecode(response.body);
    Random random = Random();
    int randomNum = random.nextInt(parsedJson['results'].length - 1);

    return parsedJson['results'][randomNum];
  }

  Future<List<dynamic>> popular(bool isMovie) async {
    var url = Uri.https(
        Config.apiUrl,
        isMovie ? Config.popularM : Config.popularT,
        {'api_key': Config.apiKey});

    final response = await http.get(url);

    final parsedJson = jsonDecode(response.body);
    // print(parsedJson['results']);
    return parsedJson['results'];
  }

  Future<List<dynamic>> trendingM(bool isDay) async {
    var url = Uri.https(
        Config.apiUrl,
        isDay ? Config.trendingMDay : Config.trendingMWeek,
        {'api_key': Config.apiKey});

    final response = await http.get(url);

    final parsedJson = jsonDecode(response.body);
    // print(parsedJson['results']);
    return parsedJson['results'];
  }

  Future<List<dynamic>> trendingT(bool isDay) async {
    var url = Uri.https(
        Config.apiUrl,
        isDay ? Config.trendingTDay : Config.trendingTWeek,
        {'api_key': Config.apiKey});

    final response = await http.get(url);

    final parsedJson = jsonDecode(response.body);
    // print(parsedJson['results']);
    return parsedJson['results'];
  }

  Future<List<dynamic>> movieByID(int id) async {
    var url = Uri.https(Config.apiUrl, '${Config.movieID}/$id',
        {'api_key': Config.apiKey});
    print(url);
    final response = await http.get(url);

    final parsedJson = jsonDecode(response.body);
    print(parsedJson['results']);
    return parsedJson['results'];
  }

  Future<List<dynamic>> tvByID(int id) async {
    var url = Uri.https(Config.apiUrl, '${Config.tvID}/$id', {
      'api_key': Config.apiKey,
    });

    final response = await http.get(url);

    final parsedJson = jsonDecode(response.body);
    // print(parsedJson['results']);
    return parsedJson['results'];
  }
}
