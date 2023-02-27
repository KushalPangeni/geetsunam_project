// To parse this JSON data, do
//
//     final artist = artistFromJson(jsonString);

import 'dart:convert';

// List<Artist> artistFromJson(String str) =>
//     List<Artist>.from(json.decode(str).map((x) => Artist.fromJson(x)));
Artist artistFromJson(String str) => Artist.fromJson(json.decode(str));

String artistToJson(Artist data) => json.encode(data.toJson());

class Artist {
  Artist({
    this.status,
    this.results,
    this.data,
  });

  String? status;
  int? results;
  Data? data;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
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
    required this.artists,
  });

  List<ArtistElement> artists;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        artists: List<ArtistElement>.from(
            json["artists"].map((x) => ArtistElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
      };
}

class ArtistElement {
  ArtistElement({
    required this.id,
    required this.fullname,
    required this.profileImage,
    required this.isFeatured,
    required this.isFavourite,
  });

  String id;
  String fullname;
  String profileImage;
  bool isFeatured;
  bool isFavourite;

  factory ArtistElement.fromJson(Map<String, dynamic> json) => ArtistElement(
        id: json["_id"],
        fullname: json["fullname"],
        profileImage: json["profileImage"],
        isFeatured: json["isFeatured"],
        isFavourite: json["isFavourite"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "profileImage": profileImage,
        "isFeatured": isFeatured,
        "isFavourite": isFavourite,
      };
}
