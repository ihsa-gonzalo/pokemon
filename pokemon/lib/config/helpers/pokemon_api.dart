import 'package:dio/dio.dart';
import 'package:pokemon/domain/pokemon_model.dart';
import 'package:pokemon/domain/pokemon_model_api.dart';

class PokemonApi
{
  final _dio = Dio();

  Future<PokemonModel> getPokemon(int number) async
  {
    final response = await _dio.get("https://pokeapi.co/api/v2/pokemon/"+number.toString());
    final pokemon_model_api = PokemonModelApi.fromJson(response.data);

    PokemonModel myPokemon = PokemonModel(pokemon_model_api.name,pokemon_model_api.sprites.frontDefault);

    print(myPokemon.image);

    return myPokemon;

  }
}