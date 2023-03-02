import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../model/featured_songs_model.dart';

class PlayerProvider with ChangeNotifier {
  final player = AudioPlayer();
  Song? songs;
  late var durationn = '';

  void open(String source) async {
    await player.setUrl(source);
    player.play();
  }

  void setsongs(Song value) {
    songs = value;
    notifyListeners();
  }
}
