// import 'dart:convert';

// import 'package:geetsunam/const.dart';
// // import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// import '../model/genres_model.dart';

// class GenreController extends GetxController {
//   var genreModel = Genre();
//   static GenreController instance = Get.find();
//   List genres = [];
//   var client = http.Client();
//   Future<List<Genre>?> getGenres() async {
//     var uri = Uri.parse('https://geetsunam.onrender.com/api/genre');
//     var response =
//         await client.get(uri, headers: {'Authorization': 'Bearer $token'});
//     Map<String, dynamic> res = json.decode(response.body);
//     genres = res['data']['genres'];

//     return null;
//   }
// }
