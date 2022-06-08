import 'package:cip/core/routes/routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isAuthenticated = false;

  void login() {
    isAuthenticated = true;
    Get.offAllNamed<void>(Routes.home);
    update();
  }
}
