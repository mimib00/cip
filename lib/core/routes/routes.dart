import 'package:cip/core/routes/middleware/auth_middleware.dart';
import 'package:cip/screens/auth/login_screen.dart';
import 'package:cip/screens/azure_poc.dart';
import 'package:cip/screens/home/controller/home_bindings.dart';
import 'package:cip/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Routes {
  static const home = '/';
  static const azureIotHubPoc = '/azure-iot-hub-poc';
  static const login = '/login';

  static List<GetPage<dynamic>> allRoutes = [
    GetPage<Widget>(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage<Widget>(name: login, page: () => const LoginScreen()),
    GetPage<Widget>(name: azureIotHubPoc, page: () => const AzurePoc()),
  ];
}
