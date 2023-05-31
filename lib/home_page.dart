// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geetsunam/pages/controller.dart';
import 'package:geetsunam/pages/drawer.dart';
import 'package:geetsunam/pages/featuredsong.dart';
import 'package:geetsunam/pages/genrepage.dart';
import 'package:geetsunam/pages/new_releases.dart';
import 'package:provider/provider.dart';

import 'controller/fetch_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("GeetSunam"),
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          child: DrawerContainer(),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final fetchProvider =
                Provider.of<FetchData>(context, listen: false);
            fetchProvider.getGenres('/genre');
            // fetchProvider.getFeaturedSongs('/songs/featured');
            fetchProvider.getNewReleasedSongs('/song/new-releases');
          },
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // FeaturedSongs(),
                      GenrePage(),
                      FeaturedSongs(),
                      NewReleases(),
                      GenrePage(),
                    ],
                  ),
                ),
              ),
              Controller()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final fetchProvider = Provider.of<FetchData>(context, listen: false);
    fetchProvider.getGenres('/genre');
    fetchProvider.getFeaturedSongs('/songs/featured');
    fetchProvider.getNewReleasedSongs('/song/new-releases');
  }
}
