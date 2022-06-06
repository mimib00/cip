import 'package:cip/screens/home/home_screen.dart';
import 'package:get/get.dart';

import '../../screens/home/controller/home_bindings.dart';

class Routes {
  static const home = '/';

  static List<GetPage<dynamic>> allRoutes = [
    GetPage(name: home, page: () => const HomeScreen(), binding: HomeBinding()),
  ];
}
