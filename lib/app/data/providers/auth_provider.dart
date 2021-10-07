import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = 'https://6159ff0a601e6f0017e5a380.mockapi.io/api/v1/users';

class BaseApi{
  static String base = "https://6159ff0a601e6f0017e5a380.mockapi.io"; //pra testar o cod, isso é um mock
  static var api = base + "/api/v1";
  var usersPath = api + "/users";
  var authPath = api + "/auth"; //exemplo

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}

class AuthAPI extends BaseApi {  Future<http.Response> signUp(String username, String email, String birthday, String cpf,
      String password, String passwordConfirmation) async {
    var body = jsonEncode({
      'customer': {
        'username': username,
        'email': email,
        'birthday': birthday,
        'cpf': cpf,
        'password': password,
        'password_confirmation': passwordConfirmation
      }
    });

    http.Response response =
        await http.post(Uri.parse(super.usersPath), headers: super.headers, body: body);
    return response;
  }

  Future<http.Response> login(String email, String password) async {
    var body = jsonEncode({'email': email, 'password': password});

    http.Response response =
        await http.post(Uri.parse(super.authPath), headers: super.headers, body: body);

    return response;
  }

}