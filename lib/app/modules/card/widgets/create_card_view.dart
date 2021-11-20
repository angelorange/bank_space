import 'package:bankinspace/app/modules/card/controller/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateCardState extends GetView<CardController> {
  final user;

  CreateCardState(this.user);

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
                    'Add Cartão',
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
                        labelText: 'Nome do proprietario',
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
                      controller: controller.cardNameController,
                      onSaved: (value) {
                        controller.cardName = value!;
                      },
                      validator: (value) {
                        return controller.validateCardName(value!);
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Numero do Cartão (sem espaços)',
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
                      controller: controller.cardNumberController,
                      onSaved: (value) {
                        controller.cardNumber = double.parse(value!);
                      },
                      validator: (value) {
                        return controller.validateCardNumber(value!);
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mês de expiração (exemplo: 03)',
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
                      controller: controller.cardMonthController,
                      onSaved: (value) {
                        controller.cardMonth = value!;
                      },
                      validator: (value) {
                        return controller.validateCardMonth(value!);
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Ano de expiração (exemplo: 2024)',
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
                      controller: controller.cardYearController,
                      onSaved: (value) {
                        controller.cardNumber = value!;
                      },
                      validator: (value) {
                        return controller.validateCardYear(value!);
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome de refêrencia OBRIGATÓRIO',
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
                      controller: controller.cardReferenceController,
                      onSaved: (value) {
                        controller.cardNumber = value ;
                      },
                      validator: (value) {
                        return controller.validateCardReference(value!);
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
                              controller.createCard(user);
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
