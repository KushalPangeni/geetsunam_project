// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geetsunam/pages/genrepage.dart';
import 'package:geetsunam/pages/listofsongs.dart';

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
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Homepage",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Artists",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            GenrePage(),
          ],
        )),
      ),
    );
  }
}
