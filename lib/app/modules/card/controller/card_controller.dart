import 'package:bankinspace/app/data/models/user_model.dart';
import 'package:bankinspace/app/data/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CardController extends GetxController {
  final GlobalKey<FormState> cardFormKey = GlobalKey<FormState>();

  late TextEditingController 
      cardNumberController,
      cardMonthController,
      cardYearController,
      cardReferenceController,
      cardNameController;

  var cardNumber, cardMonth, cardYear, cardReference, cardName;

  @override
  void onInit() {
    cardNumberController = TextEditingController();
    cardMonthController = TextEditingController();
    cardYearController = TextEditingController();
    cardReferenceController = TextEditingController();
    cardNameController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cardNumberController.dispose();
    cardMonthController.dispose();
    cardYearController.dispose();
    cardReferenceController.dispose();
    cardNameController.dispose();
  }

  void createCard(User user) {
    
      AuthAPI().createCard(cardNumberController.text, cardMonthController.text, cardYearController.text, cardReferenceController.text, cardNameController.text, user);
      
   }

   String? validateCardName(String value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Use o nome correto";
    } else {
      return null;
    }
  }

  String? validateCardNumber(String value) {
    if (value.isEmpty || !RegExp(r'^[0-9]{16}$').hasMatch(value)) {
      return "Use o número correto";
    } else {
      return null;
    }
  }

  String? validateCardMonth(String value) {
    if (value.isEmpty || !RegExp(r'^[0-9]{2}$').hasMatch(value)) {
      return "Use o mês correto";
    } else {
      return null;
    }
  }

  String? validateCardYear(String value) {
    if (value.isEmpty || !RegExp(r'^[0-9]{2}$').hasMatch(value)) {
      return "Use o ano correto";
    } else {
      return null;
    }
  }

  String? validateCardReference(String value) {
    if (value.isEmpty || !RegExp(r'^[0-9]{3}$').hasMatch(value)) {
      return "Use um nome referência correto";
    } else {
      return null;
    }
  }
     
}

