import 'package:dio/dio.dart';
import 'package:pokemon/domain/pokemon_model.dart';
import 'package:pokemon/domain/pokemon_model_api.dart';

class PokemonApi {
  final _dio = Dio();

  Future<PokemonModel?> getPokemon(String number) async {
    try {
      PokemonModel? myPokemon;
      final response = await _dio
          .get("https://pokeapi.co/api/v2/pokemon/" + number.toString());

      print(response.statusCode);

      final pokemon_model_api = PokemonModelApi.fromJson(response.data);

      myPokemon = PokemonModel(
          pokemon_model_api.name, pokemon_model_api.sprites);

      print(myPokemon.images.frontDefault);

      return myPokemon;
    } on DioError catch (_) {
      return null;
    }
  }
}
