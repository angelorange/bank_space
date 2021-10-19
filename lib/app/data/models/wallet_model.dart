import 'dart:convert';


import 'package:bankinspace/app/data/models/user_model.dart';



class Wallet {
    Wallet({
        required this.user,
        required this.amount
    });

   User user;
   double amount;

}

WalletfromJson(String s_wallet, User user) { 
 
  Map<String, dynamic> wallet_json = jsonDecode(s_wallet);
  Wallet wallet = Wallet (user:  user, amount:  wallet_json['wallet']['amount']);

  return wallet;
}

