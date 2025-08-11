import 'package:app_rick_and_morty/app/controller/splash_controller.dart';
import 'package:app_rick_and_morty/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              AppColors.splashGradientDark,
              AppColors.blackBackground,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowGreen30,
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/logomarca_app.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.loadingGreen,
                      ),
                      child: const Icon(
                        Icons.science,
                        size: 60,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 30),
              
              const Text(
                'RICK AND MORTY',
                style: TextStyle(
                  fontFamily: 'Lato-Regular.ttf',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textWhite,
                  letterSpacing: 3.0,
                  shadows: [
                    Shadow(
                      color: AppColors.shadowGreen50,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 8),
              
              const Text(
                'API EXPLORER',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textGrey400,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              
              const Spacer(flex: 2),
              
              const Column(
                children: [
                  CircularProgressIndicator(
                    color: AppColors.loadingGreen,
                    strokeWidth: 3,
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Carregando dimensões...',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textGrey400,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              
              const Text(
                'v1.0.0',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textGrey600,
                  letterSpacing: 1.0,
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}