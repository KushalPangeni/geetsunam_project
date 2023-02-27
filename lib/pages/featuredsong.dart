import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geetsunam/controller/fetch_provider.dart';
import 'package:geetsunam/model/player_separate.dart';
import 'package:geetsunam/pages/player.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../model/featured_songs_model.dart';

class FeaturedSongs extends StatefulWidget {
  const FeaturedSongs({super.key});

  @override
  State<FeaturedSongs> createState() => _FeaturedSongsState();
}

class _FeaturedSongsState extends State<FeaturedSongs> {
  PlayerSeparate playerSeparate = GetIt.instance.get<PlayerSeparate>();

  @override
  Widget build(BuildContext context) {
    var featuredSongsmodel = Provider.of<FetchData>(context, listen: false);
    return Consumer<FetchData>(
      builder: (context, value, child) => Visibility(
        visible: value.isFeaturedSongsLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Featured Songs",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 15,
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  viewportFraction: 1.12,
                  autoPlay: true,
                  enlargeCenterPage: false,
                ),
                itemCount: featuredSongsmodel.featuredSong.data?.songs.length,
                itemBuilder: (context, index, index2) {
                  var model =
                      featuredSongsmodel.featuredSong.data?.songs[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: featured(index, model ?? Song()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget featured(int index, Song songsData) {
    var feature = Provider.of<FetchData>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          log("${feature.featuredSong.data?.songs[0].toString()} ?? " " " 'wt');
          playerSeparate
              .open(feature.featuredSong.data?.songs[index].source ?? " ");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => Player(
                    songsindex: songsData,
                  )),
            ),
          );
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(4)),
          child: CachedNetworkImage(
            height: 76,
            fit: BoxFit.fill,
            //need to put some url
            imageUrl: songsData.coverArt ?? "",

            placeholder: (context, url) => const Image(
              image: AssetImage('images/cover.jpg'),
              fit: BoxFit.contain,
            ),
            errorWidget: (context, url, error) =>
                const Image(image: AssetImage('images/cover.jpg')),
          ),
        ),
      ),
    );
  }
}
