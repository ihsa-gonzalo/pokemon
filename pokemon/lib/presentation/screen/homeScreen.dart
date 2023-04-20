import 'package:flutter/material.dart';
import 'package:pokemon/domain/pokemon_model.dart';
import 'package:pokemon/presentation/provider/pokemon_provider.dart';
import 'package:provider/provider.dart';

import 'message_field_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokemon Api")),
      body: const Center(child: _HomeView()),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = context.watch<PokemonProvider>();
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        pokemonProvider.myPokemon != null
            ? MyPokemon(pokemonModel: pokemonProvider.myPokemon!)
            : const Text('Pokemon no encontrado'),
        const SizedBox(
          height: 10,
        ),
        MessageFieldBox(
          onValue: (value) {
            if (value.isNotEmpty) {
              pokemonProvider.getPokemon(value);
            }
          },
        ),
      ],
    );
  }
}

class MyPokemon extends StatelessWidget {
  final PokemonModel pokemonModel;
  const MyPokemon({super.key, required this.pokemonModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _image(url: pokemonModel.image),
        Text(pokemonModel.name.toUpperCase())
      ],
    );
  }
}

class _image extends StatelessWidget {
  const _image({required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          url,
          width: 400,
          height: 400,
          fit: BoxFit.fill,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Se esta descargando la imagen'),
            );
          },
        ));
  }
}
