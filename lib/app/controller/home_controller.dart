import 'dart:async';

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
  var allCharacters = <Character>[].obs; // Vamos usar essa variável para salvar os personagens originais

  // Criando os estados de busca
  var isSearchMode = false.obs;
  var searchQuery = ''.obs;
  var isSearching = false.obs;
  var searchResults = <Character>[].obs;

  //Debounce para a busca
  Timer? _debounceTimer;

  @override
  void onInit() {
    super.onInit();
    loadCharacters();
    ever(searchQuery, (_) => _performSearch());
  }

  @override
  void onClose() {
    _debounceTimer?.cancel();
    super.onClose();
  }

  Future<void> loadCharacters() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      
      final response = await _characterService.getCharacters(page: 1);
      
      characters.value = response.results;
      allCharacters.value = response.results; 
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
    if (isLoading.value || !hasMorePages.value || isSearchMode.value) return;

    try {
      isLoading.value = true;
      
      final response = await _characterService.getCharacters(page: currentPage.value + 1);
      
      characters.addAll(response.results);
      allCharacters.addAll(response.results);
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
    if (isSearchMode.value) {
      exitSearchMode();
    }
    currentPage.value = 1;
    hasMorePages.value = true;
    await loadCharacters();
  }

  void goToCharacterDetails(Character character) {
    Get.toNamed('/detalhes', arguments: character);
  }

  void enterSearchMode() {
    isSearchMode.value = true;
  }

  void exitSearchMode() {
    isSearchMode.value = false;
    searchQuery.value = '';
    searchResults.clear();
    characters.value = allCharacters;
    _debounceTimer?.cancel();
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query.trim();
  }

  void _performSearch() {
    _debounceTimer?.cancel();
    
    if (searchQuery.value.isEmpty) {
      characters.value = allCharacters;
      return;
    }

    _debounceTimer = Timer(Duration(milliseconds: 500), () {
      _searchCharacters();
    });
  }

  Future<void> _searchCharacters() async {
    if (searchQuery.value.isEmpty) return;

    try {
      isSearching.value = true;
      hasError.value = false;
      
      final response = await _characterService.searchCharacters(searchQuery.value);
      
      characters.value = response.results;
      searchResults.value = response.results;
      
    } catch (e) {
      characters.clear();
      hasError.value = true;
      errorMessage.value = 'Nenhum personagem encontrado para "${searchQuery.value}"';
    } finally {
      isSearching.value = false;
    }
  }
}