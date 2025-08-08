import 'package:app_rick_and_morty/app/controller/home_controller.dart';
import 'package:app_rick_and_morty/app/ui/widgets/app_bar_custom.dart';
import 'package:app_rick_and_morty/app/ui/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
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

      body: Obx(() {       

        if (controller.isLoading.value && controller.characters.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.green[700]),
                const SizedBox(height: 16),
                Text(
                  'Carregando personagens...',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        if (controller.hasError.value && controller.characters.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Ops! Algo deu errado',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    controller.errorMessage.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: controller.loadCharacters,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          );
        }


        return RefreshIndicator(
          onRefresh: controller.refreshCharacters,
          color: Colors.green[700],
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {

              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                controller.loadMoreCharacters();
              }
              return false;
            },

            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: controller.characters.length + 
                         (controller.hasMorePages.value ? 1 : 0),
              itemBuilder: (context, index) {

                if (index == controller.characters.length) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.green[700],
                      ),
                    ),
                  );
                }

                final character = controller.characters[index];
                return CharacterCard(
                  character: character,
                  onTap: () => controller.goToCharacterDetails(character),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}