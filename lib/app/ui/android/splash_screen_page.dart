import 'package:app_rick_and_morty/app/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('Splash Screen Page')),

    body: SafeArea(
      child: Text('SplashController'))
    );
  }
}