import 'dart:developer';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geetsunam/model/player_separate.dart';
import 'package:geetsunam/model/position_data.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../model/featured_songs_model.dart';

class Player extends StatefulWidget {
  final Song? songsindex;

  const Player({super.key, this.songsindex});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final PlayerSeparate playerSeparate = GetIt.instance.get<PlayerSeparate>();

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          playerSeparate.player.positionStream,
          playerSeparate.player.bufferedPositionStream,
          playerSeparate.player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.teal[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            color: Colors.black,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {
                log('padding');
              },
              color: Colors.black,
              icon: const Icon(Icons.padding),
            ),
            IconButton(
              onPressed: () {
                log('Share');
              },
              icon: const Icon(Icons.share),
              color: Colors.black,
            )
          ],
        ),
        body: StreamBuilder<PositionData>(
            stream: _positionDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: widget.songsindex?.coverArt ?? "",
                        placeholder: (context, url) => const Image(
                          image: AssetImage('images/cover.jpg'),
                          fit: BoxFit.fill,
                        ),
                        errorWidget: (context, url, error) =>
                            const Image(image: AssetImage('images/cover.jpg')),
                      ),
                    ),
                    //Song name and artist name
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 15),
                      child: Column(
                        children: [
                          Text(
                            widget.songsindex?.title ?? "",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.songsindex?.artists?.fullname ?? "",
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //ProgressBar
                    ProgressBar(
                      progress: positionData?.position ?? Duration.zero,
                      buffered: positionData?.bufferedPosition ?? Duration.zero,
                      total: positionData?.duration ?? Duration.zero,
                      onSeek: playerSeparate.player.seek,
                    ),

                    //Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shuffle),
                          iconSize: 40,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.skip_previous),
                              iconSize: 40,
                            ),
                            IconButton(
                              iconSize: 55,
                              icon: playerSeparate.player.playing
                                  ? const Icon(Icons.pause)
                                  : const Icon(Icons.play_arrow),
                              onPressed: () {
                                setState(() {
                                  if (playerSeparate.player.playing) {
                                    playerSeparate.player.pause();
                                  } else {
                                    playerSeparate.player.play();
                                  }
                                });
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                playerSeparate.player.seekToNext();
                              },
                              icon: const Icon(Icons.skip_next),
                              iconSize: 40,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.repeat),
                          iconSize: 40,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
  }
}
