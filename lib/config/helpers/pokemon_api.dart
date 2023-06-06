import 'package:dio/dio.dart';
import 'package:pokemon/domain/pokemon_model.dart';
import 'package:pokemon/domain/pokemon_model_api.dart';

class PokemonApi {
  final _dio = Dio();

  Future<PokemonModel?> getPokemon(String number) async {
    PokemonModel? myPokemon;
    final response =
        await _dio.get("https://pokeapi.co/api/v2/pokemon/$number");

    print(response.statusCode);

    final pokemonModelApi = PokemonModelApi.fromJson(response.data);

    myPokemon = PokemonModel(pokemonModelApi.name, pokemonModelApi.sprites,pokemonModelApi.sprites.frontDefault,pokemonModelApi.id);

    print(myPokemon.images.frontDefault);

    return myPokemon;
  }
}
