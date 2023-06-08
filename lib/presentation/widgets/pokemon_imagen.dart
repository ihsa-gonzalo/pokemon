import 'package:flutter/material.dart';

class PokemonImageWidget extends StatelessWidget {
  const PokemonImageWidget({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      alignment: Alignment.center,
      height: 120,
      width: 120,
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset("assets/images/pokemon_not_found.png", width: 120);
      },
      placeholder: const AssetImage("assets/images/pokemon_not_found.png"),
      image: NetworkImage(url),
    );
  }
}
