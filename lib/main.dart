import 'dart:io';

import 'package:cip/core/localization/locale.dart';
import 'package:cip/core/locator.dart' as locator;
import 'package:cip/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:get/get.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  // Enable integration testing using Appium with the Flutter Driver extension.
  enableFlutterDriverExtension();

  // Initializing app locators
  locator.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      title: 'CIP',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: Routes.allRoutes,
      initialRoute: Routes.azureIotHubPoc,

      //TODO : Add theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
