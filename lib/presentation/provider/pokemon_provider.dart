import 'package:flutter/material.dart';
import 'package:pokemon/config/helpers/pokemon_api.dart';
import 'package:pokemon/domain/pokemon_model.dart';

class PokemonProvider extends ChangeNotifier {
  PokemonApi pokemon_api = PokemonApi();

  PokemonModel? myPokemon;

  String _url = "";

  bool _isFront = true;

  bool get isFront => _isFront;

  set isFront(bool value) {
    _isFront = value;
    getImage();
  }

  String get url => _url!;

  set url(String value) {
    _url = value;
  }

  void getPokemon(String number) async {
    print("getPokemon");
    myPokemon = await pokemon_api.getPokemon(number);
    _url = myPokemon!.images.frontDefault;
    notifyListeners();
  }

  void getImage() {
    if (isFront) {
      _url = myPokemon!.images.frontDefault;
    }
    else
    {
      _url = myPokemon!.images.backDefault;
    }
    notifyListeners();
  }
}
