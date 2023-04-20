import 'package:flutter/material.dart';
import 'package:pokemon/presentation/provider/pokemon_provider.dart';
import 'package:provider/provider.dart';

import 'presentation/screen/homeScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PokemonProvider())
      ],
      child: MaterialApp(
        title: "Pokemon App",
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
