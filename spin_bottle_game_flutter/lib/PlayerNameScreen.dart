import 'package:flutter/material.dart';
import 'package:spin_bottle_game_flutter/SpinBottleScreen.dart';
class PlayerNameScreen extends StatefulWidget {
  final int numberOfPlayers;

  PlayerNameScreen({required this.numberOfPlayers});

  @override
  _PlayerNameScreenState createState() => _PlayerNameScreenState();
}

class _PlayerNameScreenState extends State<PlayerNameScreen> {
  List<String> playerNames = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Enter Player Names'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(opacity: 0.6,
            image: NetworkImage('assets/images/back.jpg'), // Replace 'assets/background.jpg' with your actual background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.numberOfPlayers,
                itemBuilder: (context, index) {
                  return TextField(
                    decoration: InputDecoration(
                      labelText: 'Player ${index + 1}',
                    ),
                    onChanged: (value) {
                      setState(() {
                        playerNames[index] = value;
                      });
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to the HomeScreen and pass the player names
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpinBottleScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.white,
                  fixedSize: Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Submit', style: TextStyle(fontSize: 25)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}