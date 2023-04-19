import 'package:flutter/material.dart';
import 'package:pokemon/domain/pokemon_model.dart';
import 'package:pokemon/presentation/provider/pokemon_provider.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(title: Text("Pokemon Api")),
      body: Center(child: _HomeView()),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = context.watch<PokemonProvider>();
    final size = MediaQuery.of(context).size;
    return FutureBuilder<PokemonModel>(
      future: pokemonProvider.getPokemon(1),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return _image(url: snapshot.data!.image);
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}

class _image extends StatelessWidget 
{
  const _image({required this.url});
  final String url;

  @override
  Widget build(BuildContext context)
   {
      final size = MediaQuery.of(context).size;

      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          url,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Pepito esta enviando una imagen'),
            );
          },
        ));
  }
}
