// To parse this JSON data, do
//
//     final genre = genreFromJson(jsonString);

import 'dart:convert';

Genre genreFromJson(String str) => Genre.fromJson(json.decode(str));

String genreToJson(Genre data) => json.encode(data.toJson());

class Genre {
  Genre({
    this.status,
    this.results,
    this.data,
  });

  String? status;
  int? results;
  Data? data;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        status: json["status"],
        results: json["results"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.genres,
  });

  List<GenreElement> genres;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        genres: List<GenreElement>.from(
            json["genres"].map((x) => GenreElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class GenreElement {
  GenreElement({
    required this.id,
    required this.name,
    required this.image,
  });

  String id;
  String name;
  String image;

  factory GenreElement.fromJson(Map<String, dynamic> json) => GenreElement(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
      };
}
