// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geetsunam/controller/fetch_provider.dart';
import 'package:provider/provider.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  void initState() {
    super.initState();
    final fetchProvider = Provider.of<FetchData>(context, listen: false);
    fetchProvider.getArtists('/artists');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Artist"),
          backgroundColor: Colors.black,
        ),
        body: Consumer<FetchData>(
          builder: (context, value, child) => Visibility(
            visible: value.isArtistLoaded,
            replacement: Center(child: CircularProgressIndicator()),
            child: Center(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: value.artist.results,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 120,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    crossAxisCount: 3),
                itemBuilder: ((context, index) {
                  log(value.artist.results.toString());
                  var artistModel = value.artist.data?.artists[index];
                  // return ListView.builder(
                  //   primary: false,
                  //   itemCount: value.artist.results,
                  //   itemBuilder: ((context, index2) {
                  //     var artistModel = model.data?.artists[index2];
                  return artistCard(artistModel?.profileImage ?? "",
                      artistModel?.fullname ?? "");
                }),
                // );
                // }),
              ),

              // ListView.builder(
              //     itemCount: value.artist.length,
              //     itemBuilder: (context, index) {
              //       var artistModel = value.artist[index];

              //         return
              // GridView.builder(
              //   itemCount: value.artists?.length,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       mainAxisSpacing: 5, crossAxisSpacing: 5, crossAxisCount: 3),
              //   itemBuilder: ((context, index) => artistCard(
              //       value.artists?[index]['profileImage'] ?? '',
              //       value.artists?[index]['fullname'])),
              // ),
              // //     ListView.builder(
              // //   itemCount: value.artists?.length,
              // //   itemBuilder: ((context, index) =>
              // //       artistCard(value.artists?[index + 3]['profileImage'],)),
              // // ),

              //         ListView.builder(
              //             physics: NeverScrollableScrollPhysics(),
              //             itemCount: artistModel.data?.artists.length,
              //             itemBuilder: ((context, index2) {
              //               var artistModelData =
              //                   artistModel.data?.artists[index2];

              //               return artistCard(
              //                 artistModelData?.profileImage ?? "",
              //                 artistModelData?.fullname ?? "",
              //               );
              //             }));

              //     }),
            ),
          ),
        ));
  }

  Widget artistCard(String imagePath, String name) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              // width: 200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Image(image: NetworkImage(imagePath), fit: BoxFit.contain),
            ),
            SizedBox(
              // height: 14,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
