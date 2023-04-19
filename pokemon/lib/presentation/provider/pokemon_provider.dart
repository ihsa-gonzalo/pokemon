import 'package:flutter/material.dart';
import 'package:pokemon/config/helpers/pokemon_api.dart';
import 'package:pokemon/domain/pokemon_model.dart';

class PokemonProvider extends ChangeNotifier
{
  PokemonApi pokemon_api = PokemonApi();


  Future<PokemonModel> getPokemon(int number) async
  {    
    return pokemon_api.getPokemon(number);
  }

}