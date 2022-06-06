import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/app_controller.dart';

Future<void> init() async {
  Get.put(AppController(), permanent: true);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put(prefs, permanent: true);
}
