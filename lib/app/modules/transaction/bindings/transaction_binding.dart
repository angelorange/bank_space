import 'package:bankinspace/app/modules/transaction/controller/transaction_controller.dart';
import 'package:get/get.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(
      () =>TransactionController(),
    );
  }
}
