// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geetsunam/controller/player_separate.dart';
import 'package:geetsunam/model/featured_songs_model.dart';
import 'package:geetsunam/pages/controller.dart';
import 'package:geetsunam/pages/player.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../controller/fetch_provider.dart';

class Listofsongs extends StatefulWidget {
  const Listofsongs({super.key});

  @override
  State<Listofsongs> createState() => _ListofsongsState();
}

class _ListofsongsState extends State<Listofsongs> {
  PlayerProvider playerSeparate = GetIt.instance.get<PlayerProvider>();
  @override
  Widget build(BuildContext context) {
    final fetchProvider = Provider.of<FetchData>(context, listen: false);
    final playProvider = Provider.of<PlayerProvider>(context, listen: false);
    // log(fetchProvider.songs.toString());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Songs"),
        ),
        body: Consumer<FetchData>(
          builder: (context, value, child) => RefreshIndicator(
            onRefresh: () async {
              fetchProvider.getSongs('/songs?page=1');
            },
            child: Visibility(
              visible: value.isSongsLoaded,
              replacement: const Center(child: CircularProgressIndicator()),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    NotificationListener<ScrollUpdateNotification>(
                      // onNotification: (){},
                      child: Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: value.songs?.length,
                          itemBuilder: ((context, index) => ListTile(
                                onTap: () async {
                                  playProvider
                                      .setsongs(value.songs?[index] ?? Song());
                                  playerSeparate
                                      .open(value.songs?[index].source ?? "");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => const Player()),
                                    ),
                                  );
                                },
                                title: Text(value.songs?[index].title ?? ""),
                                subtitle: Text(
                                    value.songs?[index].artists?.fullname ??
                                        ""),
                                trailing:
                                    Text(value.songs?[index].duration ?? " "),
                              )),
                        ),
                      ),
                    ),
                    const Controller()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    final fetchProvider = Provider.of<FetchData>(context, listen: false);
    fetchProvider.getSongs('/songs?page=1');
  }
}
