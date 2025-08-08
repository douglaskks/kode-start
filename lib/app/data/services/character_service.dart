
import 'package:app_rick_and_morty/app/data/model/character_model.dart';
import 'package:dio/dio.dart';

class CharacterService {

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
    
  );

  CharacterService() {

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (object) => print(object),
      ),
    );

  }

  Future<CharacterResponse> getCharacters({int page = 1}) async {

    try {
      final response = await _dio.get('character/?page=$page');
      return CharacterResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }

  }

  Future<Character> getCharacterById(int id) async {

    try {
      final response = await _dio.get('character/$id');
      return Character.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }

  }

  Future<CharacterResponse> searchCharacters(String name, {int page = 1}) async {

    try {
      final response = await _dio.get('character/?name=$name&page=$page');
      return CharacterResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }

  }

  String _handleError(DioException e) {

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Tempo de conexão esgotado';
      case DioExceptionType.receiveTimeout:
        return 'Tempo de resposta esgotado';
      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 404) {
          return 'Nenhum personagem encontrado';
        }
        return 'Erro do servidor: ${e.response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Requisição cancelada';
      case DioExceptionType.unknown:
        return 'Erro de conexão. Verifique sua internet';
      default:
        return 'Erro inesperado';
    }

  }
}