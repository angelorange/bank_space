import 'dart:convert';



class User {
    User({
        required this.email,
        required this.username,
        required this.fullname,
        required this.cpf,
        required this.birthday,
        required this.id,
        required this.token
    });

    String email;
    String username;
    String fullname;
    String cpf;
    String birthday;
    int id;
    String token;

}


// Creates user object from Json
userfromJson(String string, String token) { 
 
  Map<String, dynamic> user_json = jsonDecode(string);
  

  User user = User(
        email: user_json['user']['email'],
        username: user_json['user']['username'],
        fullname: user_json['user']['fullname'],
        cpf: user_json['user']['cpf'],
        birthday: user_json['user']['birthday'],
        id: user_json['user']['id'],
        token: token
  );

  return user;
}