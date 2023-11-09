import 'package:flutter/material.dart';

class SpinBottleScreen extends StatefulWidget {
  @override
  State<SpinBottleScreen> createState() => _SpinBottleScreenState();
}

class _SpinBottleScreenState extends State<SpinBottleScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
            home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Spin Bottle'),
        ),
        body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(opacity: 0.7,
              image: NetworkImage('assets/images/back.jpg'), // Replace 'assets/background.jpg' with your actual background image path
              fit: BoxFit.cover,
            ),
          ),
        )
      ),
    );
  }
}
