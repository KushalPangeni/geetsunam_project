// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geetsunam/const.dart';
import 'package:geetsunam/model/genres.dart';
import 'package:http/http.dart' as http;

class GenrePage extends StatefulWidget {
  const GenrePage({
    super.key,
  });

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  List genres = [];
  Future<List<Genre>?> getGenres() async {
    var client = http.Client();
    var uri = Uri.parse('https://geetsunam-node.onrender.com/api/genre');
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    Map<String, dynamic> res = json.decode(response.body);
    setState(() {
      genres = res['data']['genres'];
    });
    log(response.body.toString());
    return null;
  }

  @override
  void initState() {
    super.initState();
    getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) => SizedBox(
                height: 100,
                width: 100,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      child: Image(
                        image: NetworkImage(genres[index]['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(genres[index]['name']),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
