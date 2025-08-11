import 'package:app_rick_and_morty/app/controller/home_controller.dart';
import 'package:app_rick_and_morty/app/ui/theme/app_colors.dart';
import 'package:app_rick_and_morty/app/ui/widgets/app_bar_custom.dart';
import 'package:app_rick_and_morty/app/ui/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      appBar: const CustomAppBar(
        title: 'RICK AND MORTY API',
        logoPath: 'assets/images/logomarca_app.png',
        showMenuIcon: true,
        showProfileIcon: true,
        ),

      body: Obx(() {       

        /*Equanto carrega os personagens mostra o CircularProgressIndicator e a mensagem de
         Carregando personagem.
        */

        if (controller.isLoading.value && controller.characters.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppColors.loadingGreen),
                SizedBox(height: 16),
                Text(
                  'Carregando personagens...',
                  style: TextStyle(fontSize: 16, color: AppColors.textGrey600,)
                ),
              ],
            ),
          );
        }

        // Caso a requisição der erro, mostra a mensagem de erro
        if (controller.hasError.value && controller.characters.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: AppColors.errorRed,
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
                    style: const TextStyle(color: AppColors.textGrey600),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: controller.loadCharacters,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.loadingGreen,
                    foregroundColor: AppColors.textWhite,
                  ),
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshCharacters,
          color: AppColors.loadingGreen,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {

              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                controller.loadMoreCharacters();
              }
              return false;
            },
            
            // Lista de personagens gerada
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.characters.length + 
                         (controller.hasMorePages.value ? 1 : 0),
              itemBuilder: (context, index) {

                if (index == controller.characters.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.loadingGreen,
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