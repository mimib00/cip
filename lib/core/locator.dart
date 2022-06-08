import 'package:cip/core/controllers/app_controller.dart';
import 'package:cip/core/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  Get
    ..put(AppController(), permanent: true)
    ..put(AuthController(), permanent: true);
  await Get.putAsync(SharedPreferences.getInstance, permanent: true);
}
