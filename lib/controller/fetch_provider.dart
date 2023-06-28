import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geetsunam/const.dart';
import 'package:geetsunam/model/featured_songs_model.dart';
import 'package:geetsunam/model/login_data.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/artist_model.dart';

class FetchData with ChangeNotifier {
  var client = http.Client();
  List<Song>? songs = [];
  // List? genres = [];
  // bool isGenresLoaded = false;
  bool isSongsLoaded = false;
  bool isFeaturedSongsLoaded = false;
  bool isNewReleased = false;
  bool isArtistLoaded = false;
  var featuredSong = FeaturedSong();
  var newRelease = FeaturedSong();
  var artist = Artist();
  // var genre = genre_data_model.Genre();
  bool isLoginSuccessful = false;
  late SharedPreferences pref;
  String? token;

  void getArtists(String api) async {
    var client = http.Client();
    var uri = Uri.parse(baseUrl + api);
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode != 200) return log('error');
    var decodedJson = artistFromJson(response.body);
    artist = decodedJson;
    isArtistLoaded = true;
    notifyListeners();
  }

  void getFeaturedSongs(String api) async {
    var uri = Uri.parse(baseUrl + api);
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode != 200) return null;
    var decodedJson = featuredSongFromJson(response.body);
    featuredSong = decodedJson;
    isFeaturedSongsLoaded = true;
    notifyListeners();
  }

  // void getGenres(String api) async {
  //   var uri = Uri.parse(baseUrl + api);
  //   var response =
  //       await client.get(uri, headers: {'Authorization': 'Bearer $token'});
  //   if (response.statusCode != 200) return null;
  //   var decodedJson = genre_data_model.genreFromJson(response.body);
  //   // log(decodedJson.toString());
  //   genre = decodedJson;
  //   isGenresLoaded = true;
  //   notifyListeners();
  // }

  void getNewReleasedSongs(String api) async {
    var uri = Uri.parse(baseUrl + api);
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode != 200) return null;
    log('yeha ta aaxa');
    var decodedJson = featuredSongFromJson(response.body);
    newRelease = decodedJson;
    log("Why??");
    log("${newRelease.data?.songs}".toString());
    isNewReleased = true;
    notifyListeners();
  }

  void getSongs(String api) async {
    var uri = Uri.parse(baseUrl + api);
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    log("getsongs");
    log(response.statusCode.toString());
    if (response.statusCode != 200) return null;
    log(response.body.toString());
    var res = featuredSongFromJson(response.body);
    songs = res.data?.songs;
    log(songs.toString());
    log("yeha samma aaxa");
    if (songs != null) {
      isSongsLoaded = true;
    }
    notifyListeners();
  }

  void login(String email, password) async {
    pref = await SharedPreferences.getInstance();
    log("$email $password");
    try {
      Response response = await post(
          Uri.parse("https://geetsunam.onrender.com/api/users/login"),
          body: jsonEncode({'email': email, 'password': password}),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          });
      var res = loginDataFromJson(response.body);
      pref.setString('token', res.token);
      setTokenValue();
      log(token ?? "Token is null");
      if (response.statusCode == 200) {
        isLoginSuccessful = true;
        log("Successful");
      } else {
        log("Failed to response");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void setTokenValue() async {
    pref = await SharedPreferences.getInstance();

    token = pref.getString('token');
    notifyListeners();
  }
}
