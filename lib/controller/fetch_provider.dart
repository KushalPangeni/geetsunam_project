import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geetsunam/const.dart';
import 'package:geetsunam/model/featured_songs_model.dart';
import 'package:geetsunam/model/genres_model.dart' as genre_data_model;
import 'package:http/http.dart' as http;

import '../model/artist_model.dart';

class FetchData with ChangeNotifier {
  var client = http.Client();
  List? songs = [];
  List? genres = [];
  // List? artists = [];
  bool isGenresLoaded = false;
  bool isSongsLoaded = false;
  bool isFeaturedSongsLoaded = false;
  bool isArtistLoaded = false;
  var featuredSong = FeaturedSong();
  var artist = Artist();
  var genre = genre_data_model.Genre();
  String baseUrl = 'https://geetsunam.onrender.com/api';
  //response status check garexaina...............

  void getGenres(String api) async {
    var uri = Uri.parse(baseUrl + api);
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode != 200) return null;
    var decodedJson = genre_data_model.genreFromJson(response.body);
    genre = decodedJson;
    isGenresLoaded = true;
    notifyListeners();
  }

  void getSongs(String api) async {
    var uri = Uri.parse(baseUrl + api);
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    Map<String, dynamic> res = jsonDecode(response.body);
    // log(res.toString());
    songs = res['data']['songs'];
    if (songs != null) {
      isSongsLoaded = true;
    }
    notifyListeners();
  }

  void getArtists(String api) async {
    //Genre change garera Artist banauna xa hai
    var client = http.Client();
    log('welcome');
    var uri = Uri.parse(baseUrl + api);
    log('welcome 2');
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    log('welcome 3');
    // log(response.statusCode.toString());
    log(isArtistLoaded.toString());
    if (response.statusCode != 200) return log('error');
    // Map<String, dynamic> res = jsonDecode(response.body);
    // artists = res['data']['artists'];
    // log(response.body.toString());
    var decodedJson = artistFromJson(response.body);
    // log(decodedJson.toString());
    // log(1.toString());
    artist = decodedJson;
    // log(artist.toString());
    // for (int i = 0; i <= 2; i++) {
    //   artist.removeAt(i);
    // }
    // artist.removeLast();
    isArtistLoaded = true;
    log(isArtistLoaded.toString());
  }

  void getFeaturedSongs(String api) async {
    var uri = Uri.parse(baseUrl + api);
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode != 200) return null;
    var decodedJson = featuredSongFromJson(response.body);
    featuredSong = decodedJson;
    log(featuredSong.data?.songs.toString() ?? 'null');
    // log(response.body.toString());
    isFeaturedSongsLoaded = true;
    notifyListeners();
  }
}
