import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokemon/presentation/screen/homeScreen_wear.dart';
import 'package:pokemon/provider/background_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            visualDensity: VisualDensity.compact,
            colorScheme: const ColorScheme.dark(
              // dark colorscheme

              primary: Colors.white24,
              onBackground: Colors.white10,
              onSurface: Colors.white10,
            ),
          ),
          title: "Pokemon App",
          home: const WearHomeScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
