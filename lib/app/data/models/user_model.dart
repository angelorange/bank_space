// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        required this.email,
        required this.username,
        required this.password,
        required this.cpf,
        required this.birthday,
        required this.id,
        required this.token
    });

    String email;
    String username;
    String password;
    int cpf;
    String birthday;
    String id;
    String token;

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        username: json["username"],
        password: json["password"],
        cpf: json["cpf"],
        birthday: json["birthday"],
        token: json['token'],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
        "cpf": cpf,
        "birthday": birthday,
        "token": token,
        "id": id,
    };
}
