import 'package:cip/core/localization/locale.dart';
import 'package:cip/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

/// The main app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      title: 'CIP',
      debugShowCheckedModeBanner: false,
      getPages: Routes.allRoutes,

      //TODO : Add theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
