import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geetsunam/const.dart';
import 'package:geetsunam/model/songs.dart';
import 'package:http/http.dart' as http;

class Listofsongs extends StatefulWidget {
  const Listofsongs({super.key});

  @override
  State<Listofsongs> createState() => _ListofsongsState();
}

class _ListofsongsState extends State<Listofsongs> {
  List songs = [];
  Future<List<Song>?> getSongs() async {
    var client = http.Client();
    var uri = Uri.parse('https://geetsunam-node.onrender.com/api/songs?page=1');
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    Map<String, dynamic> res = json.decode(response.body);
    setState(() {
      songs = res['data']['songs'];
    });
    log(songs.toString());
    return null;
  }

  @override
  void initState() {
    super.initState();
    getSongs();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: ListView.builder(
        itemCount: songs.length,
        itemBuilder: ((context, index) => ListTile(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: ((context) => const Player())));
              },
              title: Text(songs[index]['title']),
              subtitle: Text(songs[index]['artists']['fullname']),
              trailing: Text(songs[index]['duration']),
            )),
      ),
    );
  }
}
