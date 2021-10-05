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
    if (loginFormKey.currentState!.validate()) {
      checkUser(emailController.text, passwordController.text).then((auth) {
        if (auth) {
          Get.snackbar('Login', 'Login successfully');
        } else {
          Get.snackbar('Login', 'Invalid email or password');
        }
        passwordController.clear();
      });
    }
  }
}
