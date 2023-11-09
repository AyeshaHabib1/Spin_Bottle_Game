import 'dart:math';
import 'package:flutter/material.dart';

class Dare extends StatefulWidget {
  @override
  State<Dare> createState() => _DareState();
}

class _DareState extends State<Dare> {
  final List<String> dareChallenges = [
    'Dance like nobody is watching for 2 minutes.',
    'Sing your favorite song in a funny voice.',
    'Do 10 jumping jacks in a row.',
    'Tell a funny joke without laughing.',
    // Add more dare challenges as needed
  ];

  List<String> completedDares = [];

  String randomDare = '';

  @override
  void initState() {
    super.initState();
    // Set a random dare challenge when the widget is first initialized
    getRandomDare();
  }

  void getRandomDare() {
    // Generate a random index to select a dare challenge from the list
    int randomIndex = Random().nextInt(dareChallenges.length);
    setState(() {
      randomDare = dareChallenges[randomIndex];
    });
  }

  void _showCompletedDaresDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Completed Dares'),
          content: Column(
            children: completedDares.map((dare) => Text(dare)).toList(),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Dare'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage('assets/images/back.jpg'), // Replace 'assets/background.jpg' with your actual background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                randomDare,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add the completed dare to the list
                  completedDares.add(randomDare);
                  // Change the dare challenge when the button is pressed
                  getRandomDare();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.white,
                  fixedSize: Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Done', style: TextStyle(fontSize: 25)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showCompletedDaresDialog(); // Show the completed dares dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.white,
                  fixedSize: Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Show Completed Dares', style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
