import 'package:flutter/material.dart';

class AppColors {

  AppColors._();

  // ================ CORES DE BACKGROUND ================
  static const Color primaryBackground = Color(0xFF1C1B1F);
  static const Color blackBackground = Color(0xFF000000);
  static const Color splashGradientDark = Color(0xFF1a1a1a);
  
  // ================ COR PRINCIPAL DOS CARDS ================
  static const Color primaryBlue = Color(0xFF87A1FA);
  
  // ================ CORES DE STATUS ================
  static const Color statusAlive = Color(0xFF4CAF50);
  static const Color statusDead = Color(0xFFF44336);
  static const Color statusUnknown = Color(0xFF9E9E9E);
  
  // ================ CORES DE TEXTO ================
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textWhite70 = Color(0xB3FFFFFF);
  
  static const Color textGrey400 = Color(0xFF9E9E9E);
  static const Color textGrey600 = Color(0xFF757575);
  
  // ================ CORES DE UI ================
  static const Color loadingGreen = Color(0xFF388E3C);
  static const Color errorRed = Color(0xFFF44336);
  
  // ================ CORES DE COMPONENTES ================
  static const Color borderWhite70 = Color(0xB3FFFFFF);
  static const Color borderWhite30 = Color(0x4DFFFFFF);
  static const Color searchFieldBg = Color(0x1AFFFFFF);
  
  // ================ CORES DE SHADOW/OVERLAY ================
  static const Color shadowBlack26 = Color(0x42000000);  // black.withOpacity(0.26)
  static const Color shadowGreen30 = Color(0x4D4CAF50);  // green.withOpacity(0.3)
  static const Color shadowGreen50 = Color(0x804CAF50);  // green.withOpacity(0.5)
  
  // ================ CORES DE PLACEHOLDER ================
  static const Color placeholderGrey800 = Color(0xFF424242);
    
  /// CORES DO STATUS DOS PERSONAGENS
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return statusAlive;
      case 'dead':
        return statusDead;
      default:
        return statusUnknown;
    }
  }
}