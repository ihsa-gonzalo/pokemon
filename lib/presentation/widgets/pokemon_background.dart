import 'package:flutter/material.dart';

class PokemonBackground extends StatelessWidget {
  const PokemonBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/fondo.png",
              ),
              fit: BoxFit.fill),
        ),
        child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/pokemon_not_found.png",
                  width: 120,
                  height: 120,
                ))));
  }
}
