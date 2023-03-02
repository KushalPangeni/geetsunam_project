import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/fetch_provider.dart';

class NewReleases extends StatefulWidget {
  const NewReleases({super.key});

  @override
  State<NewReleases> createState() => _NewReleasesState();
}

class _NewReleasesState extends State<NewReleases> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FetchData>(
      builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "New Releases",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 15,
              ),
              Visibility(
                visible: value.isGenresLoaded,
                replacement: const Center(child: CircularProgressIndicator()),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.newRelease.data?.songs.length,
                      itemBuilder: (context, index) {
                        var model = value.newRelease.data?.songs[index];
                        return SizedBox(
                          height: 100,
                          width: 100,
                          child: Card(
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  height: 76,
                                  fit: BoxFit.fill,
                                  imageUrl: model?.coverArt ?? "",
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
                                // Text(model?. ?? "Loading..."),
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
