class PokemonModelApi {
  PokemonModelApi({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });
  late final List<Abilities> abilities;
  late final int baseExperience;
  late final List<Forms> forms;
  late final List<GameIndices> gameIndices;
  late final int height;
  late final List<dynamic> heldItems;
  late final int id;
  late final bool isDefault;
  late final String locationAreaEncounters;
  late final List<Moves> moves;
  late final String name;
  late final int order;
  late final List<dynamic> pastTypes;
  late final Species species;
  late final Sprites sprites;
  late final List<Stats> stats;
  late final List<Types> types;
  late final int weight;

  PokemonModelApi.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    name = json['name'];
    sprites = Sprites.fromJson(json['sprites']);
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['abilities'] = abilities.map((e) => e.toJson()).toList();
    _data['base_experience'] = baseExperience;
    _data['forms'] = forms.map((e) => e.toJson()).toList();
    _data['game_indices'] = gameIndices.map((e) => e.toJson()).toList();
    _data['height'] = height;
    _data['held_items'] = heldItems;
    _data['id'] = id;
    _data['is_default'] = isDefault;
    _data['location_area_encounters'] = locationAreaEncounters;
    _data['moves'] = moves.map((e) => e.toJson()).toList();
    _data['name'] = name;
    _data['order'] = order;
    _data['past_types'] = pastTypes;
    _data['species'] = species.toJson();
    _data['sprites'] = sprites.toJson();
    _data['stats'] = stats.map((e) => e.toJson()).toList();
    _data['types'] = types.map((e) => e.toJson()).toList();
    _data['weight'] = weight;
    return _data;
  }
}

class Abilities {
  Abilities({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });
  late final Ability ability;
  late final bool isHidden;
  late final int slot;

  Abilities.fromJson(Map<String, dynamic> json) {
    ability = Ability.fromJson(json['ability']);
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ability'] = ability.toJson();
    _data['is_hidden'] = isHidden;
    _data['slot'] = slot;
    return _data;
  }
}

class Ability {
  Ability({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Forms {
  Forms({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Forms.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class GameIndices {
  GameIndices({
    required this.gameIndex,
    required this.version,
  });
  late final int gameIndex;
  late final Version version;

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version = Version.fromJson(json['version']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['game_index'] = gameIndex;
    _data['version'] = version.toJson();
    return _data;
  }
}

class Version {
  Version({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Version.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Moves {
  Moves({
    required this.move,
    required this.versionGroupDetails,
  });
  late final Move move;
  late final List<VersionGroupDetails> versionGroupDetails;

  Moves.fromJson(Map<String, dynamic> json) {
    move = Move.fromJson(json['move']);
    versionGroupDetails = List.from(json['version_group_details'])
        .map((e) => VersionGroupDetails.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['move'] = move.toJson();
    _data['version_group_details'] =
        versionGroupDetails.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Move {
  Move({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Move.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class VersionGroupDetails {
  VersionGroupDetails({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });
  late final int levelLearnedAt;
  late final MoveLearnMethod moveLearnMethod;
  late final VersionGroup versionGroup;

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = MoveLearnMethod.fromJson(json['move_learn_method']);
    versionGroup = VersionGroup.fromJson(json['version_group']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['level_learned_at'] = levelLearnedAt;
    _data['move_learn_method'] = moveLearnMethod.toJson();
    _data['version_group'] = versionGroup.toJson();
    return _data;
  }
}

class MoveLearnMethod {
  MoveLearnMethod({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class VersionGroup {
  VersionGroup({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  VersionGroup.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Species {
  Species({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Sprites {
  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });
  String backDefault = "";
  String backFemale = "";
  String backShiny = "";
  String backShinyFemale = "";
  String frontDefault = "";
  String frontFemale = "";
  String frontShiny = "";
  String frontShinyFemale = "";

  Sprites.fromJson(Map<String, dynamic> json) {
    print(json);
    backDefault = json['back_default'] ?? "";
    backFemale = json['back_female'] ?? "";
    backShiny = json['back_shiny'] ?? "";
    backShinyFemale = json['back_shiny_female'] ?? "";

    if (json['front_default'] != null) frontDefault = json['front_default'];

    frontFemale = json['front_female'] ?? "";
    frontShiny = json['front_shiny'] ?? "";
    frontShinyFemale = json['front_shiny_female'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['back_default'] = backDefault;
    _data['back_female'] = backFemale;
    _data['back_shiny'] = backShiny;
    _data['back_shiny_female'] = backShinyFemale;
    _data['front_default'] = frontDefault;
    _data['front_female'] = frontFemale;
    _data['front_shiny'] = frontShiny;
    _data['front_shiny_female'] = frontShinyFemale;
    return _data;
  }
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    this.frontFemale,
  });
  late final String frontDefault;
  late final Null frontFemale;

  DreamWorld.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['front_default'] = frontDefault;
    _data['front_female'] = frontFemale;
    return _data;
  }
}

class Home {
  Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });
  late final String frontDefault;
  late final Null frontFemale;
  late final String frontShiny;
  late final Null frontShinyFemale;

  Home.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = null;
    frontShiny = json['front_shiny'];
    frontShinyFemale = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['front_default'] = frontDefault;
    _data['front_female'] = frontFemale;
    _data['front_shiny'] = frontShiny;
    _data['front_shiny_female'] = frontShinyFemale;
    return _data;
  }
}

class Animated {
  Animated({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });
  late final String backDefault;
  late final Null backFemale;
  late final String backShiny;
  late final Null backShinyFemale;
  late final String frontDefault;
  late final Null frontFemale;
  late final String frontShiny;
  late final Null frontShinyFemale;

  Animated.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = null;
    backShiny = json['back_shiny'];
    backShinyFemale = null;
    frontDefault = json['front_default'];
    frontFemale = null;
    frontShiny = json['front_shiny'];
    frontShinyFemale = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['back_default'] = backDefault;
    _data['back_female'] = backFemale;
    _data['back_shiny'] = backShiny;
    _data['back_shiny_female'] = backShinyFemale;
    _data['front_default'] = frontDefault;
    _data['front_female'] = frontFemale;
    _data['front_shiny'] = frontShiny;
    _data['front_shiny_female'] = frontShinyFemale;
    return _data;
  }
}

class Icons {
  Icons({
    required this.frontDefault,
    this.frontFemale,
  });
  late final String frontDefault;
  late final Null frontFemale;

  Icons.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['front_default'] = frontDefault;
    _data['front_female'] = frontFemale;
    return _data;
  }
}

class Stats {
  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
  late final int baseStat;
  late final int effort;
  late final Stat stat;

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = Stat.fromJson(json['stat']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['base_stat'] = baseStat;
    _data['effort'] = effort;
    _data['stat'] = stat.toJson();
    return _data;
  }
}

class Stat {
  Stat({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Types {
  Types({
    required this.slot,
    required this.type,
  });
  late final int slot;
  late final Type type;

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = Type.fromJson(json['type']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slot'] = slot;
    _data['type'] = type.toJson();
    return _data;
  }
}

class Type {
  Type({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}
