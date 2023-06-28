// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geetsunam/controller/fetch_genre_by_id.dart';
import 'package:geetsunam/widgets/all_shimmer.dart';
import 'package:provider/provider.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({
    super.key,
  });

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FetchGenreById>(
      builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Genres",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 15,
              ),
              Visibility(
                visible: value.isGenresLoaded,
                replacement:
                    SizedBox(height: 100, child: AllShimmer.genreShimmer()),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.genre.data?.genres.length,
                      itemBuilder: (context, index) {
                        var model = value.genre.data?.genres[index];
                        return SizedBox(
                          height: 100,
                          width: 100,
                          child: Card(
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  height: 76,
                                  fit: BoxFit.fill,
                                  imageUrl: model?.image ?? "",
                                  //need to put some url
                                  // imageUrl: _.genreModel.data.genres,
                                  placeholder: (context, url) => const Image(
                                    image: AssetImage('images/cover.jpg'),
                                    fit: BoxFit.contain,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Image(
                                          image:
                                              AssetImage('images/cover.jpg')),
                                ),
                                Text(model?.name ?? "Loading..."),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          )),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
