import 'dart:math';
// import 'dart:math' as math;
//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:planets_system/models/planet.dart';

class PlanetWidget extends StatefulWidget {
  final Planet planet;

  const PlanetWidget({required this.planet});

  @override
  _PlanetWidgetState createState() => _PlanetWidgetState();
}

class _PlanetWidgetState extends State<PlanetWidget> with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotationController,
      child: Container(
        width: widget.planet.radius * 2,
        height: widget.planet.radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.planet.color,
        ),
      ),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(widget.planet.distance, 0).rotate(_rotationController.value * 2 * 3.14159),
          child: child,
        );
      },
    );
  }
}

extension OffsetRotation on Offset {
  Offset rotate(double radians) {
    final cosRadians = cos(radians);
    final sinRadians = sin(radians);
    return Offset(
      dx * cosRadians - dy * sinRadians,
      dx * sinRadians + dy * cosRadians,
    );
  }
}