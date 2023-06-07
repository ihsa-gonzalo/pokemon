import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_event.dart';
import 'package:pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon/config/helpers/string_extension.dart';
import 'package:pokemon/domain/pokemon_model.dart';
import 'package:wearable_rotary/wearable_rotary.dart';

import 'package:wearable_rotary/wearable_rotary.dart' as wearable_rotary
    show rotaryEvents;
import 'package:wearable_rotary/wearable_rotary.dart' hide rotaryEvents;

import '../../bloc/pokemon_state.dart';

class WearHomeScreen extends StatefulWidget {
  const WearHomeScreen({
    super.key,
  });

  @override
  State<WearHomeScreen> createState() => _WearHomeScreenState();
}

class _WearHomeScreenState extends State<WearHomeScreen> {
  late final StreamSubscription<RotaryEvent> rotarySubscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  _HomeView({
    super.key,
    @visibleForTesting Stream<RotaryEvent>? rotaryEvents,
  }) : rotaryEvents = rotaryEvents ?? wearable_rotary.rotaryEvents;

  final Stream<RotaryEvent> rotaryEvents;

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  final PokemonBloc _newBloc = PokemonBloc();

  late final StreamSubscription<RotaryEvent> rotarySubscription;

  int _spriteIndex = 0;
  int pokemonIndex = 99;

  @override
  void initState() {
    super.initState();
    rotarySubscription = widget.rotaryEvents.listen(handleRotaryEvent);
  }

  @override
  void dispose() {
    rotarySubscription.cancel();
    super.dispose();
  }

  void handleRotaryEvent(RotaryEvent event) {
    if (event.direction == RotaryDirection.clockwise) {
      if (_spriteIndex == 7) {
        _spriteIndex = 0;
      } else {
        _spriteIndex++;
      }
    } else {
      if (_spriteIndex > 0) {
        _spriteIndex--;
      } else {
        _spriteIndex = 7;
      }
    }
    _newBloc.add(RestoreLocalPokemon(_spriteIndex));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
            create: (context) => _newBloc,
            child: BlocListener<PokemonBloc, PokemonState>(
              listener: (context, state) {},
              child: BlocBuilder<PokemonBloc, PokemonState>(
                builder: (context, state) {
                  if (state is PokemonInitial) {
                    _newBloc.add(GetPokemon('$pokemonIndex'));
                    return _buildLoading();
                  }
                  if (state is PokemonLoaded) {
                    return MyPokemon(
                      pokemon: state.pokemon,
                      addPokemonIndex: _addPokemonIndex,
                      decreasePokemonIndex: _decreasePokemonIndex,
                    );
                  } else {
                    return _buildLoading();
                  }
                },
              ),
            )));
  }

  void _addPokemonIndex() {
    pokemonIndex++;
    _newBloc.add(GetPokemon('$pokemonIndex'));
  }

  void _decreasePokemonIndex() {
    pokemonIndex--;
    _newBloc.add(GetPokemon('$pokemonIndex'));
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());

class MyPokemon extends StatelessWidget {
  const MyPokemon(
      {super.key,
      required this.pokemon,
      this.addPokemonIndex,
      this.decreasePokemonIndex});

  final PokemonModel pokemon;
  final void Function()? addPokemonIndex;
  final void Function()? decreasePokemonIndex;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
                Center(child: _image(url: pokemon.url!)),
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
                style: const TextStyle(color: Colors.black, fontFamily: 'GB'),
              ),
            ),
            SizedBox(
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
    );
  }
}

/*
class FrontBackWidget extends StatelessWidget {
  const FrontBackWidget({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Mostrar frente"),
        Switch(
          value: pokemon.isFront,
          onChanged: (value) {
            pokemon.isFront = value;
          },
        ),
      ],
    );
  }
}
*/

class _image extends StatelessWidget {
  const _image({required this.url});
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
