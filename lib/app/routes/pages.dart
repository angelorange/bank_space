import 'package:bank_space/app/modules/home/widgets/home_page.dart';
// import 'package:bank_in_space/app/modules/register/register_page.dart';
import 'package:get/route_manager.dart';
import 'package:bank_space/app/routes/routes.dart';
class Pages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    // GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    // GetPage(name: Routes.REGISTER, page: () => RegisterPage()),
    // GetPage(name: Routes.DATA, page: () => Data())
  ];
}
