// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import '../controller/fetch_provider.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({
    super.key,
  });

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final fetchProvider = Provider.of<FetchData>(context, listen: false);
    // log(fetchProvider.genres.toString());
    return Consumer<FetchData>(
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
                replacement: Center(child: CircularProgressIndicator()),
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
}
