import 'package:bankinspace/app/data/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  // Api Simulation
  Future<bool> checkUser(String user, String password) {
    if (user == 'foo@foo.com' && password == '123') {
      return Future.value(true);
    }
    return Future.value(false);
  }

  void login() {

    AuthAPI().authUser(emailController.text, passwordController.text);
    
  }
}
