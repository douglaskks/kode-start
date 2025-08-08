
import 'package:app_rick_and_morty/app/data/model/character_model.dart';
import 'package:app_rick_and_morty/app/data/services/character_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CharacterService _characterService = CharacterService();

  var characters = <Character>[].obs;
  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;
  var currentPage = 1.obs;
  var hasMorePages = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      
      final response = await _characterService.getCharacters(page: 1);
      
      characters.value = response.results;
      currentPage.value = 1;
      hasMorePages.value = response.info.next != null;
      
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
      Get.snackbar(
        'Erro',
        'Falha ao carregar personagens: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMoreCharacters() async {
    if (isLoading.value || !hasMorePages.value) return;

    try {
      isLoading.value = true;
      
      final response = await _characterService.getCharacters(page: currentPage.value + 1);
      
      characters.addAll(response.results);
      currentPage.value++;
      hasMorePages.value = response.info.next != null;
      
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Falha ao carregar mais personagens: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshCharacters() async {
    currentPage.value = 1;
    hasMorePages.value = true;
    await loadCharacters();
  }

  void goToCharacterDetails(Character character) {
    Get.toNamed('/detalhes', arguments: character);
  }
}