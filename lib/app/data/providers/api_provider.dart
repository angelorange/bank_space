import 'dart:convert';

import 'package:bankinspace/app/data/models/notification_model.dart';
import 'package:bankinspace/app/data/models/user_model.dart';
import 'package:bankinspace/app/data/models/wallet_model.dart';
import 'package:bankinspace/app/modules/personal_page/widgets/personal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BaseApi{
  static String base = "https://protected-wave-74168.herokuapp.com"; //pra testar o cod, isso é um mock
  static var api = base;
  var signupPath = api + "/sign_up";
  var authPath = api + "/sign_in"; 
  var profilePath = api + "/api/v1/profile";
  var walletPath = api + "/api/v1/wallets";
  var transactPath = api + "/api/v1/transactions"; 
  var criptoPath = api + "/api/v1/cripto_products"; 
  var cardPath = api + "/api/v1/cards"; 

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


  Future<User> getUser(String result) async {
    var head = super.headers;
    head['Authorization'] = result;
    http.Response response =
        await http.get(Uri.parse(super.profilePath), headers: head);


    String sJson = response.body;
    User user = userfromJson(sJson, result);

    return user;
  }

  Future<Wallet> getWallet(String result, User user) async {
    var head = super.headers;
    head['Authorization'] = result;
    http.Response response =
        await http.get(Uri.parse(super.walletPath), headers: head);


    String sJson = response.body;
    Wallet wallet = WalletfromJson(sJson, user);

    return wallet;
  }


  void authUser(String email, String pass) {

    loginAuth( email, pass ).then((result) {

      var jr = "";

      try {

          var json_result = json.decode(result) as Map<String, dynamic>;


          jr = json_result['jwt'].toString();

       
    
          getUser(jr).then((auth) { 
              


            getWallet(jr, auth).then((wallet){

             
              createLoginNotification();
              Get.to(() => HomeWithSidebar(auth, wallet));
            
            
            });
          
          });
      
      
       } on FormatException catch (e) {

         createInvalidLoginNotification();

       }
      

    
    });

  }

  confirmedTransaction(String username, double value, User user) async {

      var json_result;

      try {

        var body = jsonEncode( { 'transaction':  {'receiver_username': username, 'value': value} } );

        var head = super.headers;
        head['Authorization'] = user.token;
            http.Response response =
                await http.post(Uri.parse(super.transactPath), headers: head, body: body);


        String sJson = response.body;
       

        json_result = json.decode(sJson) as Map<String, dynamic>;

      
       } on FormatException catch (e) {

         createTransactionFailed();

       }


       if (json_result['message'] == "Este usuario não existe, verifique o digitado") {createInvalidUser();}
       if (json_result['message'].contains( "Saldo Insuficiente")) {createYouHaveNoMoney();}
       if (json_result['message'] =="Ocorreu algum erro, tente novamente mais tarde") {createTransactionFailed();}
       if (json_result['message'] == "Transferência realizada com sucesso." ) {createTransactionConfirmedS(value, username);}


  }




    


  void signUpfromJson(String username, String  email, String birthday, String cpf, String fullname, String password) {

      signUpAuth( username,
                  email,
                  birthday,
                  cpf,
                  fullname,
                  password
                  )
      .then((result) {
       

        var jsonia;

        try {

          var json_result = json.decode(result) as Map<String, dynamic>;


          jsonia = json_result;

        } on FormatException catch (e) {

         print(e);

        }


        if (jsonia != null) {

         
          if (jsonia['message'] != null ) { createSignUpNotification(); }
          
          if (jsonia['username'] != null ) { createUsernameExistsNotification(); }
          
          if (jsonia['fullname'] != null ) { createFullnameErrorNotification(); }
          
          if (jsonia['cpf'] != null ) { createCPFExistsNotification(); }
          
          if (jsonia['birthday'] != null ) { createBirthdayErrorNotification(); }
        
          if (jsonia['email'] != null ) { createEmailExistsNotification(); }

          if (jsonia['password'] != null ) { createInvalidPasswordNotification();}

     

        }

    });

  }

  void createCard(String cardNumber, String cardMonth, String cardYear, String cardRefer, String cardName, User user) async {

    var json_result;

    try {

      var body = jsonEncode( { 'card':  {'card_number': cardNumber,  'card_month': cardMonth, 'card_year': cardYear, 'refer_name': cardRefer, 'card_name': cardName } } );

      var head = super.headers;
      head['Authorization'] = user.token;
          http.Response response =
              await http.post(Uri.parse(super.cardPath), headers: head, body: body);

      String sJson = response.body;
      json_result = json.decode(sJson) as Map<String, dynamic>;

    } on FormatException catch (e) {

      print(e);

    }

    if (json_result['message'] == "Cartão foi adicionado com sucesso.") { createCardSuccessNotification(); }
    if (json_result['message'] == "Alguma falha ocorreu, verifique os dados e tente novamente.") { createCardFailedNotification(); }
    if (json_result['message'] == "Cartão inválido.") { createInvalidCardNotification(); }

  }


    
}