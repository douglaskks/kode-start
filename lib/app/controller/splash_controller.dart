import 'package:app_rick_and_morty/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onInit(){
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3));
    
    Get.offAllNamed(Routes.HOME);
  }
}