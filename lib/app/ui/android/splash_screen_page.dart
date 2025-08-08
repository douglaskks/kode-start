import 'package:app_rick_and_morty/app/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      appBar: AppBar(title: const Text('Splash Screen Page')),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Carregando...', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      )
    );
  }
}