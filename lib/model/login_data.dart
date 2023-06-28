// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class Data {
  User user;

  Data({
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class LoginData {
  String status;
  String token;
  Data data;

  LoginData({
    required this.status,
    required this.token,
    required this.data,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        status: json["status"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "data": data.toJson(),
      };
}

class User {
  String id;
  String fullname;
  String email;
  String profileImage;
  bool isFeatured;
  String role;
  DateTime passwordChangedAt;

  User({
    required this.id,
    required this.fullname,
    required this.email,
    required this.profileImage,
    required this.isFeatured,
    required this.role,
    required this.passwordChangedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fullname: json["fullname"],
        email: json["email"],
        profileImage: json["profileImage"],
        isFeatured: json["isFeatured"],
        role: json["role"],
        passwordChangedAt: DateTime.parse(json["passwordChangedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "email": email,
        "profileImage": profileImage,
        "isFeatured": isFeatured,
        "role": role,
        "passwordChangedAt": passwordChangedAt.toIso8601String(),
      };
}
