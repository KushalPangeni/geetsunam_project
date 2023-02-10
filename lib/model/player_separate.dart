import 'package:just_audio/just_audio.dart';

class PlayerSeparate {
  final player = AudioPlayer();
  late var durationn = '';

  void open(int source) {
    // player.setAsset(musicList[source]['trackDetails']['source']);
    player.play();

    //------------------------------
    // player.open(
    //   Audio(musicList[source]['trackDetails']['source']),
    //   autoStart: true,
    //   showNotification: true,
    // );
  }
}
