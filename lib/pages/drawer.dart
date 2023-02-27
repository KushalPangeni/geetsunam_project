// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geetsunam/pages/artist.dart';
import 'package:geetsunam/pages/listofsongs.dart';

class DrawerContainer extends StatelessWidget {
  const DrawerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text("Homepage"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Artist"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ArtistPage())));
            },
          ),
          ListTile(
            title: Text("Songs"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Listofsongs())));
            },
          ),
          ListTile(
            title: Text("Logout"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
