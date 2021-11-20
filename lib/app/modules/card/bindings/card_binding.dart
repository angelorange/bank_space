import 'package:get/get.dart';
import 'package:bankinspace/app/modules/card/controller/card_controller.dart';


class CardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardController>(() => CardController());
  }
}