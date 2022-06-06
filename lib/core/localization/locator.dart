import 'package:cip/core/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  Get.put(AppController(), permanent: true);
  final prefs = await SharedPreferences.getInstance();
  Get.put(prefs, permanent: true);
}
