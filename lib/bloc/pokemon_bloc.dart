import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_event.dart';
import 'package:pokemon/bloc/pokemon_state.dart';
import 'package:pokemon/config/helpers/pokemon_api.dart';
import 'package:pokemon/domain/pokemon_model.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonModel? pokemon;

  PokemonBloc() : super(PokemonInitial()) {
    final PokemonApi apiRepository = PokemonApi();

    on<RestoreLocalPokemon>((event, emit) 
    {
        emit(PokemonLoading());  
        pokemon!.setUrl(event.spriteIndex);
        emit(PokemonLoaded(pokemon!));

    },);

    on<GetPokemon>((event, emit) async
    {
      try
      {
        emit(PokemonLoading());  
        pokemon = await apiRepository.getPokemon(event.name);
        pokemon!.setUrl();
        emit(PokemonLoaded(pokemon!));
      }
      on DioError catch (ex) 
      {
        if (ex.type == DioErrorType.connectionTimeout)
        {
          emit(const PokemonError("connectionTimeout"));
        }
        else
        {
          emit(const PokemonError("Error no contemplado"));
        }
        
      }
    },);

    
  }
}
