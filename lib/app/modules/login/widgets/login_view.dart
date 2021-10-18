import 'package:bankinspace/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:bankinspace/app/modules/sign_up/widgets/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:bankinspace/app/modules/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginPageState extends GetView<LoginController> {
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/jex.jpg"), fit: BoxFit.fill),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 160.0, 0.0, 0.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Righteous',
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                  child: Text(
                    '.',
                  ),
                )
              ],
            ),
          ),
          Form(
            child: Container(
                decoration: BoxDecoration(

                color: Colors.black,
                ),
                padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 30.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            fontFamily: 'Righteous',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha ',
                        labelStyle: TextStyle(
                            fontFamily: 'Righteous',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                      controller: controller.passwordController,
                      onSaved: (value) {
                        controller.password = value!;
                      },
                      validator: (value) {
                        return controller.validatePassword(value!);
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      child: Form(
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.purple,
                          color: Colors.green,
                          elevation: 7.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              onPrimary: Colors.white,
                              fixedSize: Size(250, 70),
                              elevation: 5),
                            onPressed: () {
                              controller.login();
                            },
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Righteous'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
          child:
          SizedBox(height: 30)),
          Container(
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Não possui uma conta?',
                style: TextStyle(
                  fontFamily: 'Righteous',
                  color: Colors.white
                ),
              ),
              
              SizedBox(width: 5.0),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.white,
                    fixedSize: Size(150, 28),
                    elevation: 5),
                  child: Text(
                    'Cadastre-se',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Righteous',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  
                  ),
                onPressed: () {
                  Get.to(() => SignUpView(), binding: SignUpBinding());
                },
                ),
              )
            ],
          )
        )
        ],
        )),
        ),
      ]));
  }
}