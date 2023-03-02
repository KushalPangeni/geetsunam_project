import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geetsunam/controller/player_separate.dart';
import 'package:geetsunam/pages/player.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class Controller extends StatefulWidget {
  const Controller({
    super.key,
  });

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  final PlayerProvider playerSeparate = GetIt.instance.get<PlayerProvider>();

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const Player())));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.teal[200], borderRadius: BorderRadius.circular(7)),
          height: 70,
          padding: const EdgeInsets.fromLTRB(0, 2, 5, 2),
          child: Row(
            children: [
              //Image container
              Container(
                height: 60,
                width: 90,
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: value.songs?.coverArt ?? " ",
                  placeholder: (context, url) => const Image(
                    image: AssetImage('images/cover.jpg'),
                    fit: BoxFit.fill,
                  ),
                  errorWidget: (context, url, error) =>
                      const Image(image: AssetImage('images/cover.jpg')),
                ),
              ),
              //Song name and singer name
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value.songs?.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                      maxLines: 1,
                    ),
                    Text(
                      value.songs?.artists?.fullname ?? "",
                    )
                  ],
                ),
              ),
              //Row of icon button previous pause next
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: playerSeparate.player.playing
                          // isPlayed
                          ? const Icon(Icons.pause)
                          : const Icon(Icons.play_arrow),
                      onPressed: () {
                        setState(
                          () {
                            if (playerSeparate.player.playing) {
                              playerSeparate.player.pause();
                            } else {
                              // playerSeparate.open(songsnumber);
                              playerSeparate.player.play();
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.skip_next),
                      onPressed: () {},
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
  }
}
