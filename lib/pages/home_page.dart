import 'package:flutter/material.dart';
import 'package:safe/widgets/canvas.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();

}

class HomePageState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black54,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(.05),
        title: const Text("Solar System", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body:   Center(child:Container(child: MyCanvas()),),
        bottomNavigationBar: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05)

          ),
          child: const Center(child: Text(
            '🥰 Like and follow 🥰',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold

            ),

          ),
          ),
        ),
    );
  }

}

