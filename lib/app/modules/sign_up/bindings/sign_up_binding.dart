import 'package:get/get.dart';
import 'package:bank_space/app/modules/login/controller/login_controller.dart';
import 'package:bank_space/app/modules/sign_up/controller/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
  }
}
