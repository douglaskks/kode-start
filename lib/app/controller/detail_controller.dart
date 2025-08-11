import 'package:app_rick_and_morty/app/data/model/character_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {

  var character = Rx<Character?>(null);
  var isLoading = false.obs;
  var firstEpisodeName = ''.obs;

  @override

  void onInit() {
    super.onInit();
    _loadCharacterData();
    
  }

  void _loadCharacterData() {

    try {
      isLoading.value = true;
      
      final Character? receivedCharacter = Get.arguments as Character?;
      
      if (receivedCharacter != null) {
        character.value = receivedCharacter;
        _loadFirstEpisode();
      } else {
        Get.snackbar(
          'Erro',
          'Personagem não encontrado',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.back();
      }
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Erro ao carregar dados do personagem',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.back();
    } finally {
      isLoading.value = false;
    }

  }

  void _loadFirstEpisode() {

    if (character.value?.episode.isNotEmpty == true) {
      final firstEpisodeUrl = character.value!.episode.first;

      final episodeNumber = firstEpisodeUrl.split('/').last;
      firstEpisodeName.value = 'Episódio $episodeNumber';
    } else {
      firstEpisodeName.value = 'Não informado';
    }

  }

  RxString get statusColor {

    switch (character.value?.status.toLowerCase()) {
      case 'alive':
        return 'green'.obs;
      case 'dead':
        return 'red'.obs;
      default:
        return 'grey'.obs;
    }

  }

  RxString get statusIcon {

    switch (character.value?.status.toLowerCase()) {
      case 'alive':
        return 'favorite'.obs;
      case 'dead':
        return 'heart_broken'.obs;
      default:
        return 'help'.obs;
    }

  }

  void goBack() {

    Get.back();

  }
}