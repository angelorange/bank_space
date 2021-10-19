import 'package:bankinspace/app/data/models/user_model.dart';
import 'package:bankinspace/app/data/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  late TextEditingController valueController,
    usernameController = TextEditingController();
    var username = '';
    var value = 0.0;
    

    
  @override
  void onInit() {
    super.onInit();
   
    usernameController = TextEditingController();
    valueController = TextEditingController();
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
   
    usernameController.dispose();
    valueController.dispose();

  }

  String? validateUsername(String value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Enter correct username";
    } else {
      return null;
    }
  }

 String? validateValue(double value) {
    if (value <= 4 ) {
      return "Enter correct value";
    } else {
      return null;
    }
  }

  
  void transact(String username, double value, User user) {


    AuthAPI().confirmedTransaction(username, value, user);
    
  }




  
}