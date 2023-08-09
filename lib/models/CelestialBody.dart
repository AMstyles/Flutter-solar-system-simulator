import 'package:flutter/material.dart';
import 'dart:math';

class CelestialBody{

  String name;
  double radius;
  double mass;
  double distanceFromSun;
  Color color;
  Offset position = const Offset(0, 0);

  CelestialBody({required this.name,
    required this.radius,
    required this.mass,
    required this.distanceFromSun,
    required this.color,

  });

  void updatePosition(double angle){
    position = Offset(distanceFromSun*cos(angle), distanceFromSun*sin(angle));
  }


}