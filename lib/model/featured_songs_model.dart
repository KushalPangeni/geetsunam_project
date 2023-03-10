// To parse this JSON data, do
//
//     final featuredSong = featuredSongFromJson(jsonString);

import 'dart:convert';

FeaturedSong featuredSongFromJson(String str) =>
    FeaturedSong.fromJson(json.decode(str));

String featuredSongToJson(FeaturedSong data) => json.encode(data.toJson());

class FeaturedSong {
  FeaturedSong({
    this.status,
    this.results,
    this.data,
  });

  String? status;
  int? results;
  Data? data;

  factory FeaturedSong.fromJson(Map<String, dynamic> json) => FeaturedSong(
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
    required this.songs,
  });

  List<Song> songs;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        songs: List<Song>.from(json["songs"].map((x) => Song.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "songs": List<dynamic>.from(songs.map((x) => x.toJson())),
      };
}

class Song {
  Song({
    this.id,
    this.title,
    this.coverArt,
    this.artists,
    this.source,
    this.genre,
    this.duration,
    this.releasedDate,
    this.uploadedDate,
    this.isFeatured,
    this.stream,
    this.isFavourite,
  });

  String? id;
  String? title;
  String? coverArt;
  Artists? artists;
  String? source;
  Genre? genre;
  String? duration;
  DateTime? releasedDate;
  DateTime? uploadedDate;
  bool? isFeatured;
  String? stream;
  bool? isFavourite;

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["_id"],
        title: json["title"],
        coverArt: json["coverArt"],
        artists: Artists.fromJson(json["artists"]),
        source: json["source"],
        genre: Genre.fromJson(json["genre"]),
        duration: json["duration"],
        releasedDate: DateTime.parse(json["releasedDate"]),
        uploadedDate: DateTime.parse(json["uploadedDate"]),
        isFeatured: json["isFeatured"],
        stream: json["stream"],
        isFavourite: json["isFavourite"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "coverArt": coverArt,
        "artists": artists?.toJson(),
        "source": source,
        "genre": genre?.toJson(),
        "duration": duration,
        "releasedDate":
            "${releasedDate?.year.toString().padLeft(4, '0')}-${releasedDate?.month.toString().padLeft(2, '0')}-${releasedDate?.day.toString().padLeft(2, '0')}",
        "uploadedDate": uploadedDate?.toIso8601String(),
        "isFeatured": isFeatured,
        "stream": stream,
        "isFavourite": isFavourite,
      };
}

class Artists {
  Artists({
    required this.id,
    required this.fullname,
    required this.email,
    required this.profileImage,
    required this.isFeatured,
  });

  String id;
  String fullname;
  String email;
  String profileImage;
  bool isFeatured;

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        id: json["_id"],
        fullname: json["fullname"],
        email: json["email"],
        profileImage: json["profileImage"],
        isFeatured: json["isFeatured"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "email": email,
        "profileImage": profileImage,
        "isFeatured": isFeatured,
      };
}

class Genre {
  Genre({
    required this.id,
    required this.name,
    required this.image,
  });

  String id;
  String name;
  String image;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
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
