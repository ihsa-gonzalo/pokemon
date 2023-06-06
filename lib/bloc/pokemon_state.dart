import 'package:equatable/equatable.dart';
import 'package:pokemon/domain/pokemon_model.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final PokemonModel pokemon;

  const PokemonLoaded(this.pokemon);
}

class PokemonError extends PokemonState {
  final String? message;
  const PokemonError(this.message);
}
