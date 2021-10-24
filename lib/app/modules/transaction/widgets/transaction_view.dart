import 'package:bankinspace/app/modules/transaction/controller/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateTransactionState extends GetView<TransactionController> {
  final TransactionController _transactionController =
      Get.put(TransactionController());

  final user;

  CreateTransactionState(this.user);

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
                    'Transferir',
                    style: TextStyle(
                        fontSize: 50.0,
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
                padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 30.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome do Usuário',
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
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Valor',
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
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: controller.valueController,
                      onSaved: (value) {
                        controller.value = double.parse(value!);
                      },
                      validator: (value) {
                        return controller.validateValue(double.parse(value!));
                      },
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
                              controller.transact(
                                  controller.usernameController.text,
                                  double.parse(controller.valueController.text),
                                  user);
                            },
                            child: Center(
                              child: Text(
                                'Confirmar Transfêrencia',
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
                    Container(child: SizedBox(height: 30)),
                  ],
                )),
          ),
        ]));
  }
}
