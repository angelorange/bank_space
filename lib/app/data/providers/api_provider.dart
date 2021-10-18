import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = 'https://6159ff0a601e6f0017e5a380.mockapi.io/api/v1/users';

class BaseApi{
  static String base = "https://protected-wave-74168.herokuapp.com"; //pra testar o cod, isso é um mock
  static var api = base;
  var signupPath = api + "/sign_up";
  var authPath = api + "/sign_in"; //exemplo
  var profilePath = api + "/api/v1/profile"; //exemplo
  var walletPath = api + "/api/v1/wallets"; //exemplo

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}

class AuthAPI extends BaseApi {  
  
  Future<String> signUpAuth(String username, String email, String birthday, String cpf, String fullname, String password) async {
    var body = jsonEncode({
      'user': {
        'username': username,
        'email': email,
        'birthday': birthday,
        'cpf': cpf,
        'fullname': fullname,
        'password': password,
      }
    });

    http.Response response =
        await http.post(Uri.parse(super.signupPath), headers: super.headers, body: body);
    return response.body;

  }


  Future<String> loginAuth(String email, String password) async {
    var body = jsonEncode( { 'user':  {'email': email, 'password': password} } );

    http.Response response =
        await http.post(Uri.parse(super.authPath), headers: super.headers, body: body);

    return response.body;
  }