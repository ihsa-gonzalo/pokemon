import 'package:flutter/material.dart';
import 'package:pokemon/config/helpers/string_extension.dart';
import 'package:pokemon/presentation/widgets/pokemon_imagen.dart';
import 'package:provider/provider.dart';

import '../../domain/pokemon_model.dart';
import '../../provider/background_provider.dart';

class MyPokemon extends StatelessWidget {
  const MyPokemon(
      {super.key,
      required this.pokemon,
      this.addPokemonIndex,
      this.decreasePokemonIndex,
      this.changePokemonIndex});

  final PokemonModel pokemon;
  final void Function()? addPokemonIndex;
  final void Function()? decreasePokemonIndex;
  final void Function()? changePokemonIndex;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BackgroundProvider>(context);

    return ChangeNotifierProvider(
        create: (_) => BackgroundProvider(),
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  provider.background,
                ),
                fit: BoxFit.fill),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 150,
                    color: const Color.fromARGB(135, 255, 255, 255),
                    child: Text(
                      "Pokémon #${pokemon.id}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'GB',
                      ),
                    )),
                // Container(color: Colors.amber, width: 10, height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                        onPressed: decreasePokemonIndex,
                        iconSize: 20,
                        color: Colors.black,
                        icon: const Icon(Icons.arrow_back)),
                    GestureDetector(
                        onTap: changePokemonIndex,
                        onLongPress: () {
                          print("onLongPress");
                          provider.setBackground();
                        },
                        onDoubleTap: () {
                          print("onDoubleTap");
                          provider.setBackground();
                        },
                        child: Center(
                            child: PokemonImageWidget(url: pokemon.url!))),
                    IconButton(
                        onPressed: addPokemonIndex,
                        iconSize: 20,
                        color: Colors.black,
                        icon: const Icon(Icons.arrow_forward_sharp)),
                  ],
                ),
                //Container(color: Colors.amber, width: 10, height: 10),
                Container(
                  width: 150,
                  color: const Color.fromARGB(135, 255, 255, 255),
                  child: Text(
                    textAlign: TextAlign.center,
                    pokemon.name.capitalize(),
                    style:
                        const TextStyle(color: Colors.black, fontFamily: 'GB'),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    width: 150,
                    color: const Color.fromARGB(135, 255, 255, 255),
                    child: Text(
                      pokemon.image_des!.capitalize(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 10, color: Colors.black, fontFamily: 'GB'),
                    )),
                //FrontBackWidget(pokemon: pokemon)
              ],
            ),
          ),
        ));
  }
}