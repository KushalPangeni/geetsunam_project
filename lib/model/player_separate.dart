import 'package:flutter/material.dart';
import 'package:geetsunam/model/songs_model.dart';
import 'package:just_audio/just_audio.dart';

class PlayerSeparate with ChangeNotifier {
  final player = AudioPlayer();
  Song? songs;
  late var durationn = '';

  void open(String source) async {
    await player.setUrl(songs?.source ?? " ");
    player.play();
  }
}
