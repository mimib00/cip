import 'package:cip/screens/home/controller/home_bindings.dart';
import 'package:cip/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Routes {
  static const home = '/';

  static List<GetPage<dynamic>> allRoutes = [
    GetPage<Widget>(name: home, page: () => const HomeScreen(), binding: HomeBinding()),
  ];
}
