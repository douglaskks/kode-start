import 'package:app_rick_and_morty/app/bindings/detail_biding.dart';
import 'package:app_rick_and_morty/app/bindings/home_binding.dart';
import 'package:app_rick_and_morty/app/bindings/splash_binding.dart';
import 'package:app_rick_and_morty/app/routes/app_routes.dart';
import 'package:app_rick_and_morty/app/ui/android/detail_page.dart';
import 'package:app_rick_and_morty/app/ui/android/home_page.dart';
import 'package:app_rick_and_morty/app/ui/android/splash_screen_page.dart';
import 'package:get/get.dart';

class AppPages {
  
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PERSON_DETAILS,
      page: () => DetailPage(),
      binding: DetailBinding(),
      ),
  ];

}