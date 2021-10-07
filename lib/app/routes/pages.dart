import 'package:bank_space/app/modules/home/widgets/home_page.dart';
import 'package:bank_space/app/modules/login/bindings/login_binding.dart';
import 'package:bank_space/app/modules/login/widgets/login_view.dart';
import 'package:bank_space/app/modules/sign_up/widgets/sign_up_view.dart';
import 'package:bank_space/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:get/route_manager.dart';
import 'package:bank_space/app/routes/routes.dart';

class Pages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginPageState(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.SIGN_UP,
        page: () => SignUpView(),
        binding: SignUpBinding())
    // GetPage(name: Routes.DATA, page: () => Data())
  ];
}
