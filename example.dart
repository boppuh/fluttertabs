import 'package:flutter/material.dart';

//import './colors.dart';

class ExercisesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Exercises'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            child: const Text('Go!'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ExercisesPage()),
              );
              // push another route
            },
          ),
        ),
      ),
    );
  }
}