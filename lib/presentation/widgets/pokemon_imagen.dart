import 'package:flutter/material.dart';

class PokemonImageWidget extends StatelessWidget {
  const PokemonImageWidget({required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      //color: Colors.amber,
      child: Image.network(
        url,
        width: 120,
        height: 120,
        fit: BoxFit.fitWidth,
        errorBuilder: (context, error, stackTrace) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/pokemon_not_found.png",
                width: 120,
                height: 120,
              ));
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Se esta descargando la imagen'),
          );
        },
      ),
    );
  }
}
