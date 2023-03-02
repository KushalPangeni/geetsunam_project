import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geetsunam/const.dart';
import 'package:geetsunam/model/featured_songs_model.dart';
import 'package:geetsunam/model/genres_model.dart' as genre_data_model;
import 'package:http/http.dart' as http;

import '../model/artist_model.dart';

class FetchData with ChangeNotifier {
  var client = http.Client();
  List<Song>? songs = [];
  List? genres = [];
  bool isGenresLoaded = false;
  bool isSongsLoaded = false;
  bool isFeaturedSongsLoaded = false;
  bool isNewReleased = false;
  bool isArtistLoaded = false;
  var featuredSong = FeaturedSong();
  var newRelease = FeaturedSong();
  var artist = Artist();
  var genre = genre_data_model.Genre();
  String baseUrl = 'https://geetsunam.onrender.com/api';

  void getArtists(String api) async {
    var client = http.Client();
    var uri = Uri.parse(baseUrl + api);
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode != 200) return log('error');
    var decodedJson = artistFromJson(response.body);
    artist = decodedJson;
    isArtistLoaded = true;
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
    var res = featuredSongFromJson(response.body);
    songs = res.data?.songs;
    if (songs != null) {
      isSongsLoaded = true;
    }
    notifyListeners();
  }
}
