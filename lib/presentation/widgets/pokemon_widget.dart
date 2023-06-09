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
      this.changePokemonIndex, required this.provider});

  final PokemonModel pokemon;
  final void Function()? addPokemonIndex;
  final void Function()? decreasePokemonIndex;
  final void Function()? changePokemonIndex;
  final BackgroundProvider provider;

  @override
  Widget build(BuildContext context) {

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
                  margin: const EdgeInsets.only(top: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      color: const Color.fromARGB(135, 255, 255, 255),
                      child: Text(
                          "Pokémon #${pokemon.id}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontFamily: 'GB',
                          ),
                        ),
                    ),
                  ),
                ),
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
                        onPanUpdate: (details) {
                          if (details.delta.dx > 0) 
                          {
                              addPokemonIndex!();
                          }
                          if (details.delta.dx < 0)
                          {
                             decreasePokemonIndex!();
                          }
                        },
                        onTap: changePokemonIndex,
                        onLongPress: () {
                          provider.setBackground();
                        },
                        onDoubleTap: () {
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: const Color.fromARGB(135, 255, 255, 255),
                    child: Text(
                        pokemon.name.capitalize(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontFamily: 'GB',
                        ),
                      ),
                  ),
                )
                
              ,
                const SizedBox(
                  height: 5,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: const Color.fromARGB(135, 255, 255, 255),
                    child: Text(
                       pokemon.image_des!.capitalize(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 5,
                          color: Colors.black,
                          fontFamily: 'GB',
                        ),
                      ),
                  ),
                )
                //FrontBackWidget(pokemon: pokemon)
              ],
            ),
          ),
        ));
  }
}
