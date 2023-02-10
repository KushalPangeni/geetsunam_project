import 'package:flutter/material.dart';
import 'package:geetsunam/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List genres = [];
  // String token =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZTRlOTg4ZTYyZTdjYTU2Y2E3MDY2NCIsImlhdCI6MTY3NTk0NjQ5MSwiZXhwIjoxNjgzNzIyNDkxfQ.INDZ7L785r992KZTnIleUHru8VRepw3IfKj1aNqGsDg';
  // Future<List<Genre>?> getGenres() async {
  //   var client = http.Client();
  //   var uri = Uri.parse('https://geetsunam-node.onrender.com/api/genre');
  //   var uri1 =
  //       Uri.parse('https://geetsunam-node.onrender.com/api/songs?page=1');
  //   var response =
  //       await client.get(uri, headers: {'Authorization': 'Bearer $token'});
  //   var response1 =
  //       await client.get(uri1, headers: {'Authorization': 'Bearer $token'});
  //   Map<String, dynamic> res = json.decode(response.body);
  //   genres = res['data']['genres'];
  //   log(response1.body.toString());
  //   return null;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getGenres();
  // }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}
