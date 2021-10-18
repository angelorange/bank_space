// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';


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

    
}
