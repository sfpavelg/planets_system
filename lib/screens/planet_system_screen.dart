import 'package:flutter/material.dart';
import 'package:planets_system/services/add_planet_screen.dart';
import 'package:planets_system/models/planet.dart';
import 'package:planets_system/widgets/planet_widget.dart';
import 'package:planets_system/models/sun.dart';

class PlanetSystemScreen extends StatefulWidget {
  @override
  _PlanetSystemScreenState createState() => _PlanetSystemScreenState();
}

class _PlanetSystemScreenState extends State<PlanetSystemScreen> {
  List<Planet> planets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planet System'),
      ),
      body: Center(
        child: Stack(
          children: [
            Sun(),
            for (final planet in planets) PlanetWidget(planet: planet),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPlanetScreen()),
          ).then((newPlanet) {
            if (newPlanet != null) {
              setState(() {
                planets.add(newPlanet);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}