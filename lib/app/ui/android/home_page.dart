import 'package:app_rick_and_morty/app/ui/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: const CustomAppBar(
        title: 'RICK AND MORTY API',
        logoPath: 'assets/images/logomarca_app.png',
        showMenuIcon: true,
        showProfileIcon: true,
        ),

      body: Container(),
    );
  }
}