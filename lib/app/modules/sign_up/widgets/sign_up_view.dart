import 'package:bankinspace/app/modules/sign_up/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:bankinspace/app/modules/login/widgets/login_view.dart';
import 'package:get/get.dart';

class SignUpView extends GetView<SignUpController> {
  final _formKey = GlobalKey<FormState>();

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
                    'Sign Up',
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
          Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 30.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome Completo',
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
                    keyboardType: TextInputType.name,
                    controller: controller.fullnameController,
                    onSaved: (value) {
                      controller.fullname = value!;
                    },
                    validator: (value) {
                      return controller.validateFullname(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'CPF',
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
                    keyboardType: TextInputType.name,
                    controller: controller.cpfController,
                    onSaved: (value) {
                      controller.cpf = value!;
                    },
                    validator: (value) {
                      return controller.validateCPF(value!);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email ',
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
                    obscureText: false,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome de usuário ',
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
                    controller: controller.usernameController,
                    onSaved: (value) {
                      controller.username = value!;
                    },
                    validator: (value) {
                      return controller.validateUsername(value!);
                    },
                    obscureText: false,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
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
                    keyboardType: TextInputType.name,
                    controller: controller.birthdayController,
                    onSaved: (value) {
                      controller.birthday = value!;
                    },
                    validator: (value) {
                      return controller.validateBirthday(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
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
                      child: Material(
                        key: _formKey,
                        borderRadius: BorderRadius.circular(20.0),
                        elevation: 7.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              onPrimary: Colors.white,
                              fixedSize: Size(250, 70),
                              elevation: 5),
                          onPressed: () {
                            controller.signUp();
                          },
                          child: Text(
                            'Confirmar',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Righteous'),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => LoginPageState());
                        },
                        child: Center(
                          child: Text(
                            'Voltar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Righteous',
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ]));
  }
}
