import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerSeparate with ChangeNotifier {
  final player = AudioPlayer();
  late var durationn = '';

  void open(String source) async {
    await player.setUrl(source);
    player.play();
  }
}
