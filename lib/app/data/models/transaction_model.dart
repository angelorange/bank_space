import 'dart:convert';

import 'package:bankinspace/app/data/models/user_model.dart';



class Transaction {
    Transaction({
        required this.user,
        required this.username,
        required this.value
    });

    User user;
    String username;
    String value;

}


// Creates user object from 
//
transactionfromJson(String string, User user) { 
 
  Map<String, dynamic> transaction_json = jsonDecode(string);
  

  Transaction transaction = Transaction(
        
        username: transaction_json['transaction']['username'],
        value: transaction_json['transaction']['value'],
        user: user
  );

  return transaction;
}