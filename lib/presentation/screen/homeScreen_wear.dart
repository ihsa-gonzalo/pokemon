import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_event.dart';
import 'package:pokemon/bloc/shops_bloc.dart';
import 'package:pokemon/config/helpers/string_extension.dart';
import 'package:pokemon/domain/pokemon_model.dart';
import 'package:wearable_rotary/wearable_rotary.dart';

import 'package:wearable_rotary/wearable_rotary.dart' as wearable_rotary
    show rotaryEvents;
import 'package:wearable_rotary/wearable_rotary.dart' hide rotaryEvents;

import '../../bloc/pokemon_state.dart';

class WearHomeScreen extends StatefulWidget {
  WearHomeScreen({
    super.key,
    @visibleForTesting Stream<RotaryEvent>? rotaryEvents,
  }) : rotaryEvents = rotaryEvents ?? wearable_rotary.rotaryEvents;

  final Stream<RotaryEvent> rotaryEvents;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rotarySubscription = widget.rotaryEvents.listen(handleRotaryEvent);
    rotarySubscription.onData((data) {
        print("hola");

     });
     rotarySubscription.onDone(() { 

        print("hola 2");
     });

     
  }

  @override
  void dispose() {
    rotarySubscription.cancel();
    super.dispose();
  }

  void handleRotaryEvent(RotaryEvent event) {
   print(rotaryEvents.first.toString());
  }


}

class _HomeView extends StatelessWidget {
  final PokemonBloc _newBloc = PokemonBloc();

  _HomeView({super.key});

  initState() {
    // ignore: avoid_print
    print("initState Called");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //

    return SafeArea(
        child: BlocProvider(
            create: (context) => _newBloc,
            child: BlocListener<PokemonBloc, PokemonState>(
              listener: (context, state) {},
              child: BlocBuilder<PokemonBloc, PokemonState>(
                builder: (context, state) {
                  if (state is PokemonInitial) {
                    _newBloc.add(const GetPokemon("25"));
                    return _buildLoading();
                  }
                  if (state is PokemonLoaded) {
                    return MyPokemon(
                      pokemon: state.pokemon,
                    );
                  } else {
                    return _buildLoading();
                  }
                },
              ),
            )));
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());

class MyPokemon extends StatelessWidget {
  final PokemonModel pokemon;
  const MyPokemon({super.key, required this.pokemon});

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
            Text(
              "Pokémon #${pokemon.id}",
              style: const TextStyle(color: Colors.black),
            ),
            // Container(color: Colors.amber, width: 10, height: 10),
            Center(child: _image(url: pokemon.url)),
            //Container(color: Colors.amber, width: 10, height: 10),
            Text(
              pokemon.name.capitalize(),
              style: const TextStyle(color: Colors.black),
            ),
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
