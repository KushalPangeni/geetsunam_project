// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geetsunam/pages/artist.dart';
import 'package:geetsunam/pages/listofsongs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerContainer extends StatefulWidget {
  const DrawerContainer({super.key});

  @override
  State<DrawerContainer> createState() => _DrawerContainerState();
}

class _DrawerContainerState extends State<DrawerContainer> {
  late SharedPreferences preferences;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal[90],
        // borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(),
            currentAccountPictureSize: Size.fromRadius(40.0),
            currentAccountPicture: Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image(
                image: AssetImage("images/me.png"),
                fit: BoxFit.cover,
              ),
            ),
            accountName: Text(
              "Kushal Pangeni",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              "kushalpangeni03@gmail.com",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            title: Text("Homepage"),
            leading: Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Artist"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ArtistPage())));
            },
          ),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text("Songs"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Listofsongs())));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () async {
              Navigator.pop(context);
              Navigator.pop(context);
              await preferences.remove('token');
            },
          )
        ],
      ),
    );
  }
}
