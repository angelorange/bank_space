import 'package:bank_space/app/modules/home/widgets/home_page.dart';
import 'package:bank_space/app/modules/personal_page/widgets/personal_wallet.dart';
import 'package:bank_space/app/modules/sign_up/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:bank_space/app/modules/login/widgets/login_view.dart';
import 'package:bank_space/app/modules/personal_page/widgets/profile.dart';
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
              padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 30.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    controller: controller.usernameController,
                    onSaved: (value) {
                      controller.username = value!;
                    },
                    validator: (value) {
                      return controller.validateUsername(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Birthday',
                      labelStyle: TextStyle(
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email ',
                      labelStyle: TextStyle(
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
                    obscureText: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Cpf ',
                      labelStyle: TextStyle(
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty || !RegExp())
                    // },
                    obscureText: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password ',
                      labelStyle: TextStyle(
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      return controller.validatePassword(value!);
                    },
                    obscureText: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password ',
                      labelStyle: TextStyle(
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
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
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   print('succesfull');
                            // }
                          },
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                  HomeWithSidebar()); //Pra onde o botão submit tem que autenticar
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Righteous'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
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
                          Get.to(LoginPageState());
                        },
                        child: Center(
                          child: Text(
                            'Go Back',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Righteous'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Container(),
          SizedBox(height: 35.0),
        ]));
  }
}
