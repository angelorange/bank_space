import 'package:bankinspace/app/data/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  late TextEditingController emailController,
    passwordController,
    cpfController,
    birthdayController,
    fullnameController,
    usernameController = TextEditingController();
    var username = '';
    var cpf = '';
    var fullname = '';
    var email = '';
    var password = '';
    var birthday = '';

    
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    cpfController = TextEditingController();
    fullnameController = TextEditingController();
    birthdayController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    cpfController.dispose();
    fullnameController.dispose();
    birthdayController.dispose();
  }

  String? validateEmail(String value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Enter correct email";
    } else {
      return null;
    }
  }

  String? validateUsername(String value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Enter correct username";
    } else {
      return null;
    }
  }

  String? validateFullname(String value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Enter correct full name";
    } else {
      return null;
    }
  }

  // String? validatePassword(String value) {
  //   if (value.length < 6) {
  //     return "Password must be of 6 characters";
  //   }
  //   return null;
  // }


  String? validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }

    String? validateBirthday(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter your birthday';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid birthday';
      else
        return null;
    }
  }

  String? validateCPF(String value) {
    
    if (value.isEmpty) {
      return 'Please enter your CPF';
    } else {
      return null;
    }
  }
  

  

  void signUp() {

    AuthAPI().signUpfromJson( usernameController.text,
                              emailController.text,
                              birthdayController.text,
                              cpfController.text,
                              fullnameController.text,
                              passwordController.text);
   
  }

}
