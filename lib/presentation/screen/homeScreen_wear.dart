import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_event.dart';
import 'package:pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon/config/helpers/string_extension.dart';
import 'package:pokemon/domain/pokemon_model.dart';
import 'package:pokemon/presentation/widgets/pokemon_background.dart';
import 'package:provider/provider.dart';
import 'package:wearable_rotary/wearable_rotary.dart';

import 'package:wearable_rotary/wearable_rotary.dart' as wearable_rotary
    show rotaryEvents;
import 'package:wearable_rotary/wearable_rotary.dart' hide rotaryEvents;

import '../../bloc/pokemon_state.dart';
import '../../provider/background_provider.dart';
import '../widgets/pokemon_widget.dart';

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
                    return const PokemonBackground();
                  }
                  if (state is PokemonLoaded) {
                    return MyPokemon(
                      pokemon: state.pokemon,
                      addPokemonIndex: _addPokemonIndex,
                      decreasePokemonIndex: _decreasePokemonIndex,
                      changePokemonIndex: _changePokemonIndex,
                    );
                  } else {
                    return Container();
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

  void _changePokemonIndex() {
    int intValue = Random().nextInt(1000) + 1; // Value is >= 50 and < 150.
    pokemonIndex = intValue;
    _newBloc.add(GetPokemon('$intValue'));
  }
}
