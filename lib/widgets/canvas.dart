import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' ;
import '../models/CelestialBody.dart';

class MyCanvas extends StatefulWidget{
  const MyCanvas({super.key});

  @override
  State<StatefulWidget> createState() => MyCanvasState();
  
}

class MyCanvasState extends State<StatefulWidget>{

  List<CelestialBody>  celestialBodies = [
    CelestialBody(name: "Mercury", radius: 8, mass: 200, distanceFromSun: 70, color:  Colors.yellow),
    CelestialBody(name: "Venus", radius: 13, mass: 200, distanceFromSun: 110, color: Colors.redAccent),
    CelestialBody(name: "Earth", radius: 12, mass: 200, distanceFromSun: 150, color:  Colors.blue),
    CelestialBody(name: "Mars", radius: 6, mass: 200, distanceFromSun: 190, color: Colors.pink),
  ];

  double currAngle = 0;
  double currAngle1 = 0;
  double currAngle2 = 0;
  double currAngle3 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        for(int i = 0; i<celestialBodies.length; i++)
          {
            CelestialBody celestialBody = celestialBodies[i];
            switch(i){
              case 0:
                celestialBody.updatePosition(currAngle);
                break;
              case 1:
                celestialBody.updatePosition(currAngle1);
                break;
              case 2:
                celestialBody.updatePosition(currAngle2);
                break;
              case 3:
                celestialBody.updatePosition(currAngle3);
                break;
            }

          }

        currAngle = (currAngle + 0.01)%(pi * 2);
        currAngle1 = (currAngle1 + 0.009)%(pi * 2);
        currAngle2 = (currAngle2 + 0.005)%(pi * 2);
        currAngle3 = (currAngle3 + 0.001)%(pi * 2);

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyCustomPaint(celestialBodies: celestialBodies),
    );
  }

}

class MyCustomPaint extends CustomPainter{

  List<CelestialBody>  celestialBodies;

  MyCustomPaint({required this.celestialBodies});




  @override
  void paint(Canvas canvas, Size size) {

    final center = Offset(size.width / 2, size.height / 2);

    //todo:drawing the Sun
    var mainPaint = Paint()
        ..color = Colors.amber;

    canvas.drawCircle(center, 25, mainPaint);

    //todo: draw the planets
    for(CelestialBody cBody in celestialBodies){

      //paint for orbit
      Paint orbit = Paint()
        ..color = cBody.color
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;

      //paint for planet
      Paint planet = Paint()
        ..color = cBody.color;

      //draw the orbit and planet
      canvas.drawCircle(center, cBody.distanceFromSun, orbit);
      canvas.drawCircle(cBody.position, cBody.radius, planet);

    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}