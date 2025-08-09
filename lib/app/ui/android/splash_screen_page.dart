import 'package:app_rick_and_morty/app/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              Color(0xFF1a1a1a),
              Color(0xFF000000),
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green[700],
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
              
              Text(
                'RICK AND MORTY',
                style: TextStyle(
                  fontFamily: 'Lato-Regular.ttf',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3.0,
                  shadows: [
                    Shadow(
                      color: Colors.green.withOpacity(0.5),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 8),
              
              Text(
                'API EXPLORER',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              
              const Spacer(flex: 2),
              
              Column(
                children: [
                  CircularProgressIndicator(
                    color: Colors.green[700],
                    strokeWidth: 3,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Carregando dimensões...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              
              Text(
                'v1.0.0',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
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