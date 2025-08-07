import 'package:app_rick_and_morty/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppPages {
  
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => Container()),
    GetPage(name: Routes.HOME, page: () => Container()),
    GetPage(name: Routes.PERSON_DETAILS, page: () => Container()),
  ];

}