import 'package:flutter/material.dart';
import 'package:planets_system/data/list_color_options.dart';
import 'package:planets_system/models/color_option.dart';
import 'package:planets_system/models/planet.dart';

class AddPlanetScreen extends StatefulWidget {
  @override
  _AddPlanetScreenState createState() => _AddPlanetScreenState();
}

class _AddPlanetScreenState extends State<AddPlanetScreen> {
  double radius = 30;
  Color? color;
  double distance = 100;
  double speed = 1;



  ColorOption? selectedColorOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Planet'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Planet Radius'),
            Slider(
              value: radius,
              min: 10,
              max: 100,
              onChanged: (newValue) {
                setState(() {
                  radius = newValue;
                });
              },
            ),
            SizedBox(height: 16),
            Text('Planet Color'),
            DropdownButton<ColorOption>(
              value: selectedColorOption,
              onChanged: (newValue) {
                setState(() {
                  selectedColorOption = newValue;
                  color = newValue?.color;
                });
              },
              items: colorOptions.map((option) {
                return DropdownMenuItem<ColorOption>(
                  value: option,
                  child: Text(option.name),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text('Planet Distance'),
            Slider(
              value: distance,
              min: 50,
              max: 150,
              onChanged: (newValue) {
                setState(() {
                  distance = newValue;
                });
              },
            ),
            SizedBox(height: 16),
            Text('Planet Speed'),
            Slider(
              value: speed,
              min: 0.5,
              max: 2,
              onChanged: (newValue) {
                setState(() {
                  speed = newValue;
                });
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final newPlanet = Planet(
                  radius: radius,
                  color: color ?? Colors.blue, // По умолчанию выбирается цвет blue, если пользователь не выбрал другой цвет
                  distance: distance,
                  speed: speed,
                );
                Navigator.pop(context, newPlanet);
              },
              child: Text('Add Planet'),
            ),
          ],
        ),
      ),
    );
  }
}