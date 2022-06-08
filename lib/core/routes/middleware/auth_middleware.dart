import 'package:cip/core/controllers/auth_controller.dart';
import 'package:cip/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  final authService = Get.find<AuthController>(); // Here is error, this line can't find UserController
  @override
  int? get priority => 1;
  bool isAuthenticated = false;

  @override
  RouteSettings? redirect(String? route) {
    isAuthenticated = authService.isAuthenticated;
    if (isAuthenticated == false) {
      return const RouteSettings(name: Routes.login);
    }
    return null;
  }
}
