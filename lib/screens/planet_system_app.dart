import 'package:flutter/material.dart';
import 'package:planets_system/screens/planet_system_screen.dart';

class PlanetSystemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planet System',
      home: PlanetSystemScreen(),
    );
  }
}