import 'package:app_rick_and_morty/app/routes/app_pages.dart';
import 'package:app_rick_and_morty/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Aplicativo Rick and Morty',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes, // Usado para settar os arquivos de rotas do GetMaterialApp
      initialRoute: Routes.INITIAL,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    )
  );
}