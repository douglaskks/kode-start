import 'package:app_rick_and_morty/app/bindings/splash_binding.dart';
import 'package:app_rick_and_morty/app/routes/app_routes.dart';
import 'package:app_rick_and_morty/app/ui/android/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(name: Routes.HOME, page: () => Container(child: Center(child: Text("Teste"),),)),
    GetPage(name: Routes.PERSON_DETAILS, page: () => Container()),
  ];

}