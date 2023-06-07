import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class GetPokemon extends PokemonEvent {
  final String name;
  const GetPokemon(this.name);
}

class RestoreLocalPokemon extends PokemonEvent {
  final int spriteIndex;
  const RestoreLocalPokemon(this.spriteIndex);
}