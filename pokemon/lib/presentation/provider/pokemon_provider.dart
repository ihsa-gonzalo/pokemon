import 'package:flutter/material.dart';
import 'package:pokemon/config/helpers/pokemon_api.dart';
import 'package:pokemon/domain/pokemon_model.dart';

class PokemonProvider extends ChangeNotifier {
  PokemonApi pokemon_api = PokemonApi();

  PokemonModel? myPokemon;

  void getPokemon(String number) async {
    print("getPokemon");
    myPokemon = await pokemon_api.getPokemon(number);
    notifyListeners();
  }
}
