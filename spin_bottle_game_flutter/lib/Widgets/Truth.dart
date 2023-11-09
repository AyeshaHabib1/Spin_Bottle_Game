import 'dart:math';
import 'package:flutter/material.dart';

class Truth extends StatefulWidget {
  @override
  State<Truth> createState() => _TruthState();
}

class _TruthState extends State<Truth> {
  final List<String> truthQuestions = [
    'What is your biggest fear?',
    'What is your favorite childhood memory?',
    'What is your most embarrassing moment?',
    'If you could travel anywhere in the world, where would you go?',
    // Add more truth questions as needed
  ];

  String randomQuestion = '';
  TextEditingController answerController = TextEditingController();
  List<String> answers = [];

  @override
  void initState() {
    super.initState();
    // Set a random question when the widget is first initialized
    getRandomQuestion();
  }

  void getRandomQuestion() {
    // Generate a random index to select a question from the list
    int randomIndex = Random().nextInt(truthQuestions.length);
    setState(() {
      randomQuestion = truthQuestions[randomIndex];
    });
  }

  void _showAnswersDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('User Answers'),
          content: Column(
            children: answers.map((answer) => Text(answer)).toList(),
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
        title: Text('Truth'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(opacity: 0.7,
            image: NetworkImage('assets/images/back.jpg'), // Replace 'assets/background.jpg' with your actual background image path
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                randomQuestion,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: answerController,
                  decoration: InputDecoration(labelText: 'Your Answer'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String userAnswer = answerController.text;
                  answers.add(userAnswer); // Add the answer to the list of answers
                  // Do something with the user's answer
                  print('User\'s Answer: $userAnswer');
                  // Change the question when the button is pressed
                  getRandomQuestion();
                  // Clear the text field after changing the question
                  answerController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.white,
                  fixedSize: Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Submit',style: TextStyle(fontSize: 25)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showAnswersDialog(); // Show the answers dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.white,
                  fixedSize: Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Show Answers',style: TextStyle(fontSize: 25)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
