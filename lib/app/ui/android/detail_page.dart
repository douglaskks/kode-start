import 'package:app_rick_and_morty/app/controller/detail_controller.dart';
import 'package:app_rick_and_morty/app/ui/theme/app_colors.dart';
import 'package:app_rick_and_morty/app/ui/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.blackBackground,
      appBar: CustomAppBar(
        title: 'RICK AND MORTY API',
        logoPath: 'assets/images/logomarca_app.png',
        backgroundColor: AppColors.primaryBackground,
        titleColor: AppColors.textWhite,
        showMenuIcon: false,
        showProfileIcon: true,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textWhite),
            onPressed: controller.goBack,
          ),
        ),
      ),
      
      body: Obx(() {

        if (controller.isLoading.value || controller.character.value == null) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.loadingGreen),
          );
        }

        final character = controller.character.value!;

        return SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 20),
              
              Center(
                child: Container(
                  width: 320,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shadowBlack26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Column(
                      children: [

                        //Imagem
                        Container(
                          height: 160,
                          width: 320,
                          child: CachedNetworkImage(
                            imageUrl: character.image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: AppColors.placeholderGrey800,
                              child: const Center(
                                child: CircularProgressIndicator(color: AppColors.loadingGreen),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: AppColors.placeholderGrey800,
                              child: const Icon(Icons.error, size: 50, color: AppColors.errorRed),
                            ),
                          ),
                        ),
                        
                        Container(
                          width: 320,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryBlue,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              //Nome do Personagem
                              Text(
                                character.name.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textWhite,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Status do Personagem e Espécie do Personagem
                              Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: AppColors.getStatusColor(character.status),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.textWhite, width: 1),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${character.status} - ${character.species}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.textWhite,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 12),
                              
                              // Última localização do personagem
                              const Text(
                                'Last know location:',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textWhite70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                character.location.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              
                              const SizedBox(height: 12),
                              
                              // Primeira aparição do Personagem
                              const Text(
                                'First seen in:',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textWhite70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              const SizedBox(height: 4),


                              Obx(() => Text(
                                controller.firstEpisodeName.value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                              ),
                              
                              const SizedBox(height: 12),

                              // Gênero
                              const Text(
                                'Gender:',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textWhite70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                character.gender,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 12),

                              // Origem
                              const Text(
                                'Origin:',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textWhite70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              
                              const SizedBox(height: 4),

                              Text(
                                character.origin.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),              
            ],
          ),
        );
      }),
    );
  }
}