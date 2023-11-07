import 'package:flutter/material.dart';
import 'PlayerNameScreen.dart';
import 'game_screen.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayerSelectionScreen extends StatefulWidget {
  const PlayerSelectionScreen({Key? key}) : super(key: key);

  @override
  _PlayerSelectionScreenState createState() => _PlayerSelectionScreenState();
}

class _PlayerSelectionScreenState extends State<PlayerSelectionScreen> {
  double numberOfPlayers = 2;
  int selectedPlayer = 2;
  String selectedBottleImage = 'assets/bottle.png'; // Default bottle image
  final player = AudioPlayer();
  bool isPlaying = false;
  String selectedDropdownValue = 'Option 1'; // Default dropdown value
  bool sound = true;

  void selectPlayer(int player) {
    setState(() {
      selectedPlayer = player;
    });
  }

  void navigateToPlayerNameScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayerNameScreen(
          numberOfPlayers: numberOfPlayers.toInt(),
          bottleImage: selectedBottleImage,
          sound: sound,
          onNamesSubmitted: (List<String> playerNames) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GameScreen(
                  numberOfPlayers: numberOfPlayers.toInt(),
                  playerNames: playerNames,
                  bottleImage: selectedBottleImage,
                                  sound: sound,
                ),
              ),
            );
          },
        ),
      ),
    );
  }


  void selectBottleImage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tap to Select An Image'),
          content: SizedBox(
            width: double.maxFinite,
            height: 370,
            child: ListView(
              children: [
                Wrap(
                  spacing: 17.0, // Adjust spacing between items
                  runSpacing: 8.0, // Adjust spacing between rows
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/bottle.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/bottle.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/Bottle1.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/Bottle1.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/Bottle2.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/Bottle2.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/Bottle3.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/Bottle3.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/Bottle4.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/Bottle4.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/Bottle5.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/Bottle5.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/Bottle6.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/Bottle6.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/Bottle7.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/Bottle7.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/Bottle8.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/Bottle8.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/Bottle9.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/Bottle9.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/Bottle10.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/Bottle10.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/knife.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/knife.png'), // Replace with your desired text
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sound) {
                          playSound("sound/PictureSelect.wav");
                        }
                        setState(() {
                          selectedBottleImage = 'assets/knife1.png';
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                          'assets/knife1.png'), // Replace with your desired text
                    ),
                    // Add more GestureDetector widgets for additional options
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void playSound(String soundPath) async {
    if (isPlaying) {
      await player.stop(); // Stop the currently playing sound
    }
    if (sound) {
      await player.play(AssetSource(soundPath)); // Play the specified sound
      isPlaying = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.6,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    child: Text(
                      "Name: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    child: Text('   Ayesha Habib'),
                  ),
                  const PopupMenuItem<String>(
                    child: Text(
                      'SUPERVISED BY:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    child: Text('   Muhammad Abdullah'),
                  ),
                ];
              },
              child: const Text(
                "Menu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

            ),
          ),
          Positioned(
            top: 35,
            right: 16,
            child: Row(
              children: [
                const Text(
                  'Sound On/Off:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16), // Make the text bold
                ),
                Switch(
                  value: sound,
                  onChanged: (value) {
                    setState(() {
                      sound = value;
                      if (sound) {
                        playSound('sound/playerselect.mp3');
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Select Number of Players:',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      numberOfPlayers.toInt().toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 300,
                      child: SliderTheme(
                        data: SliderThemeData(
                          thumbColor: Colors.green,
                          activeTrackColor: Colors.green.withOpacity(0.9),
                          inactiveTrackColor: Colors.black38.withOpacity(0.5),
                          trackHeight: 12,
                          // Increase track height
                          overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 32),
                          // Increase overlay size
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 14), // Increase thumb size
                        ),
                        child: Slider(
                          value: numberOfPlayers,
                          min: 2,
                          max: 8,
                          divisions: 6,
                          onChanged: (value) {
                            setState(() {
                              playSound('sound/playerselect.mp3');
                              numberOfPlayers = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (sound) {
                          playSound("sound/gameclick.mp3");
                        }
                        navigateToPlayerNameScreen();
                      },
                      style: ElevatedButton.styleFrom(

                        padding: const EdgeInsets.all(25),
                        backgroundColor: Colors.black,
                      ),
                      child: const Text('Simple Spin',style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),
                    const SizedBox(width: 20),

                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (sound) {
                      playSound("sound/gameclick.mp3");
                    }
                    selectBottleImage();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(55),
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text('Select An Image'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Set preferred orientation to portrait
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
