import 'package:app_rick_and_morty/app/controller/detail_controller.dart';
import 'package:app_rick_and_morty/app/ui/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1B1F),
      appBar: CustomAppBar(
        title: 'RICK AND MORTY API',
        logoPath: 'assets/images/logomarca_app.png',
        backgroundColor: const Color(0xFF1C1B1F),
        titleColor: Colors.white,
        showMenuIcon: false,
        showProfileIcon: true,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: controller.goBack,
          ),
        ),
      ),
      body: Obx(() {

        if (controller.isLoading.value || controller.character.value == null) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
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
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Column(
                      children: [

                        Container(
                          height: 160,
                          width: 320,
                          child: CachedNetworkImage(
                            imageUrl: character.image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.grey[800],
                              child: const Center(
                                child: CircularProgressIndicator(color: Colors.blue),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey[800],
                              child: const Icon(Icons.error, size: 50, color: Colors.red),
                            ),
                          ),
                        ),
                        
                        Container(
                          width: 320,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color(0xFF987A1FA),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                character.name.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                  letterSpacing: 1.5,
                                ),
                              ),
                              
                              const SizedBox(height: 16),
                              
                              Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: _getStatusColor(character.status),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 1),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${character.status} - ${character.species}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 12),
                              
                              Text(
                                'Last know location:',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: const Color(0xFFFFFFFF).withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                character.location.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              
                              const SizedBox(height: 12),
                              
                              Text(
                                'First seen in:',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: const Color(0xFFFFFFFF).withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Obx(() => Text(
                                controller.firstEpisodeName.value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
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

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return Colors.green;
      case 'dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}