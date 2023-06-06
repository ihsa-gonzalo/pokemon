import 'package:flutter/material.dart';
import 'package:pokemon/presentation/screen/homeScreen_wear.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: WearHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
