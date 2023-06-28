import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geetsunam/const.dart';
import 'package:geetsunam/controller/fetch_provider.dart';
import 'package:geetsunam/model/genres_model.dart' as genre_data_model;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FetchGenreById extends ChangeNotifier {
  FetchData fetchData = FetchData();
  var client = http.Client();
  var genre = genre_data_model.Genre();
  List? genres = [];
  bool isGenresLoaded = false;
  String? token;
  late SharedPreferences pref;

  void getGenres(String api) async {
    getToken();
    var uri = Uri.parse(baseUrl + api);
    log(token.toString());
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    log('called1');
    if (response.statusCode != 200) return null;
    log('called2');
    var decodedJson = genre_data_model.genreFromJson(response.body);
    genre = decodedJson;
    isGenresLoaded = true;
    log(isGenresLoaded.toString());
    notifyListeners();
  }

  void getToken() async {
    pref = await SharedPreferences.getInstance();

    token = pref.getString('token');
  }
}
