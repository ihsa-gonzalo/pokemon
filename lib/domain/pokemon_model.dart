import 'package:pokemon/domain/pokemon_model_api.dart';

class PokemonModel {
  final String name;
  final int id;
  final Sprites images;
  String? url;
  String? image_des;

  PokemonModel(this.name, this.images, this.id);

  void setUrl([int index = 0]) {
    switch (index) {
      case 0:
        url = images.frontDefault;
        image_des = "Frente";
        break;
      case 1:
        url = images.frontFemale;
        image_des = "Frente hembra";
        break;
      case 2:
        url = images.frontShiny;
        image_des = "Frente shiny";
        break;
      case 3:
        url = images.frontShinyFemale;
        image_des = "Frente shiny hembra";
        break;
      case 4:
        url = images.backDefault;
        image_des = "Dorso";
        break;
      case 5:
        url = images.backFemale;
        image_des = "Dorso hembra";
        break;
      case 6:
        url = images.backShiny;
        image_des = "Dorso shiny";
        break;
      case 7:
        url = images.backShinyFemale;
        image_des = "Dorso shiny hembra";
        break;
    }
  }
}
