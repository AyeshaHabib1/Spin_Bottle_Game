import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class GameScreen extends StatefulWidget {
  final int numberOfPlayers;
  final List<String> playerNames;
  final String bottleImage;

  final bool sound;

  const GameScreen({
    Key? key,
    required this.numberOfPlayers,
    required this.playerNames,
    required this.bottleImage,

    required this.sound,
  }) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  var random = Random();

  late AnimationController _animationController;
  late Animation<double> _animation;
  late Tween<double> _tween;

  List<String> players = [];
  final player = AudioPlayer();
  bool isPlaying = false;
  bool sound = false;

  void playSound(String soundPath) async {
    if (widget.sound && isPlaying) {
      await player.stop(); // Stop the currently playing sound
    }

    if (widget.sound) {
      await player.play(AssetSource(soundPath)); // Play the specified sound
      isPlaying = true;
    }
  }

  double getRandom() {
    return random.nextDouble();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 3), // Increase the duration for slower animation
    );
    _tween = Tween<double>(
      begin: 0.0,
      end: 0.0,
    );
    _animation = _tween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve:
        Curves.easeOut, // Apply an easing curve for smoother deceleration
      ),
    );
    _animationController.forward();
    sound = widget.sound;

  }

  @override
  void dispose() {
    // Cleanup operations or resource release
    // should be performed here
    player.dispose();
    // Call super.dispose() at the end
    super.dispose();
  }

  void restartAnimation() {
    setState(() {
      double randomEndValue = getRandom();
      if (widget.numberOfPlayers == 2) {
        if (randomEndValue < 0.5) {
          randomEndValue = 0.75; // Stop at top for 2 players
        } else {
          randomEndValue = 0.25; // Stop at bottom for 2 players
        }
      } else if (widget.numberOfPlayers == 3) {
        if (randomEndValue < 0.25) {
          randomEndValue = 0.75; // Stop at top for 3 players
        } else if (randomEndValue < 0.5) {
          randomEndValue = 0.5; // Stop at the left for 3 players
        } else {
          randomEndValue = 0.25; // Stop at bottom for 3 players
        }
      } else if (widget.numberOfPlayers == 4) {
        if (randomEndValue < 0.25) {
          randomEndValue = 0.75; // Stop at top for 4 players
        } else if (randomEndValue < 0.5) {
          randomEndValue = 0.5; // Stop at left for 4 players
        } else if (randomEndValue < 0.75) {
          randomEndValue = 0.0; // Stop at right for 4 players
        } else {
          randomEndValue = 0.25; // Stop at bottom for 4 players
        }
      } else if (widget.numberOfPlayers == 5) {
        if (randomEndValue < 0.25) {
          randomEndValue = 0.75; // Stop at top for 5 players
        } else if (randomEndValue < 0.375) {
          randomEndValue = 0.625; // Stop at top_Left for 5 players
        } else if (randomEndValue < 0.5) {
          randomEndValue = 0.5; // Stop at left for 5 players
        } else if (randomEndValue < 0.75) {
          randomEndValue = 0.25; // Stop at Bottom for 5 players
        } else {
          randomEndValue = 0.0; // Stop at Right for 5 players
        }
      } else if (widget.numberOfPlayers == 6) {
        if (randomEndValue < 0.25) {
          randomEndValue = 0.75; // Stop at top for 6 players
        } else if (randomEndValue < 0.375) {
          randomEndValue = 0.625; // Stop at top_Left for 6 players
        } else if (randomEndValue < 0.5) {
          randomEndValue = 0.5; // Stop at left for 6 players
        } else if (randomEndValue < 0.75) {
          randomEndValue = 0.25; // Stop at Bottom for 6 players
        } else if (randomEndValue < 0.875) {
          randomEndValue = 0.125; // Stop at Bottom_Right for 6 players
        } else {
          randomEndValue = 0.0; // Stop at Right for 6 players
        }
      } else if (widget.numberOfPlayers == 7) {
        if (randomEndValue < 0.125) {
          randomEndValue = 0.875; // Stop at top_Right for 7 players
        } else if (randomEndValue < 0.25) {
          randomEndValue = 0.75; // Stop at top for 7 players
        } else if (randomEndValue < 0.375) {
          randomEndValue = 0.625; // Stop at top_Left for 7 players
        } else if (randomEndValue < 0.5) {
          randomEndValue = 0.5; // Stop at left for 7 players
        } else if (randomEndValue < 0.75) {
          randomEndValue = 0.25; // Stop at Bottom for 7 players
        } else if (randomEndValue < 0.875) {
          randomEndValue = 0.125; // Stop at Bottom_Right for 7 players
        } else {
          randomEndValue = 0.0; // Stop at Right for 7 players
        }
      } else if (widget.numberOfPlayers == 8) {
        if (randomEndValue < 0.125) {
          randomEndValue = 0.875; // Stop at top_Right for 8 players
        } else if (randomEndValue < 0.25) {
          randomEndValue = 0.75; // Stop at top for 8 players
        } else if (randomEndValue < 0.375) {
          randomEndValue = 0.625; // Stop at top_Left for 8 players
        } else if (randomEndValue < 0.5) {
          randomEndValue = 0.5; // Stop at left for 8 players
        } else if (randomEndValue < 0.625) {
          randomEndValue = 0.375; // Stop at Bottom_left for 8 players
        } else if (randomEndValue < 0.75) {
          randomEndValue = 0.25; // Stop at Bottom for 8 players
        } else if (randomEndValue < 0.875) {
          randomEndValue = 0.125; // Stop at Bottom_Right for 8 players
        } else {
          randomEndValue = 0.0; // Stop at Right for 8 players
        }
      }

      _tween.end =
          2 * pi + randomEndValue - 0.03; // Update the end value of the tween
      _animationController.reset();
      _animationController.forward().whenComplete(() {
        Future.delayed(const Duration(seconds: 1), () {
          double currentPosition = randomEndValue;
          String winner;
          if (currentPosition == 0.75) {
            // Send Winner for Top Player 1
            winner = widget.playerNames[0];
          } else if (currentPosition == 0.875) {
            // Send Winner for Top_Right Player 7
            winner = widget.playerNames[6];
          } else if (currentPosition == 0.375) {
            // Send Winner for Bottom_Left Player 8
            winner = widget.playerNames[7];
          } else if (currentPosition == 0.25) {
            // Send Winner for Bottom Player 2
            winner = widget.playerNames[1];
          } else if (currentPosition == 0.125) {
            // Send Winner for Bottom_Right Player 6
            winner = widget.playerNames[5];
          } else if (currentPosition == 0.5) {
            // Send Winner for Left Player 3
            winner = widget.playerNames[2];
          } else if (currentPosition == 0.625) {
            // Send Winner for Top_Left Player 5
            winner = widget.playerNames[4];
          } else {
            // Send Winner for Right Player 4
            winner = widget.playerNames[3];
          }
          playSound('sound/victoryapplause.mp3');
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () async {
                  if (isPlaying) {
                    player.stop();
                    isPlaying = false;
                  }
                  return true;
                },
                child: AlertDialog(
                  title: const Align(
                    alignment: Alignment.center,
                    child: Text('Winner',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Colors.green),
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: Container(
                      color: Colors.greenAccent,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'The winner is ',
                              ),
                              Text(
                                winner,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Center(
                            child: Icon(
                              Icons.emoji_events,
                              size: 50,
                              color: Colors.yellow,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          if (isPlaying) {
                            player.stop();
                            isPlaying = false;
                          }
                          Navigator.of(context).pop();
                          // Add any additional actions here if needed
                        },
                        child: const Text('OK'),
                      ),
                    ),
                  ],
                ),
              );
            },
          );

        });
      });
    });
  }

  void addPlayer(String player) {
    setState(() {
      players.add(player);
    });
  }


  @override
  Widget build(BuildContext context) {
    final double playerSize = MediaQuery.of(context).size.width * 0.1;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: null, // Removal of Title Bar
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.78,
                  child: AspectRatio(
                    aspectRatio: 1.2,
                    child: Stack(
                      children: [
                        if (widget.numberOfPlayers >= 1)
                          Positioned(
                            left: playerSize * 3.2,
                            child: Text(
                              widget.playerNames.isNotEmpty
                                  ? widget.playerNames[0]
                                  : 'Player 1',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        if (widget.numberOfPlayers >= 5)
                          Positioned(
                            top: playerSize * 1.4,
                            left: playerSize * 1.2,
                            child: Text(
                              widget.playerNames.isNotEmpty
                                  ? widget.playerNames[4]
                                  : 'Player 5',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        if (widget.numberOfPlayers >= 7)
                          Positioned(
                            top: playerSize * 1.4,
                            right: playerSize * 1.2,
                            child: Text(
                              widget.playerNames.isNotEmpty
                                  ? widget.playerNames[6]
                                  : 'Player 7',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        if (widget.numberOfPlayers >= 3)
                          Positioned(
                            top: playerSize * 2.8,
                            left: 0.0,
                            child: Text(
                              widget.playerNames.length >= 3
                                  ? widget.playerNames[2]
                                  : 'Player 3',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        Positioned(
                          top: playerSize,
                          left: playerSize,
                          right: playerSize,
                          bottom: playerSize,
                          child: GestureDetector(
                            child: RotationTransition(
                              turns: _animation,
                              child: Image.asset(
                                widget.bottleImage,
                              ),
                            ),
                          ),
                        ),
                        if (widget.numberOfPlayers >= 2)
                          Positioned(
                            bottom: 0.0,
                            left: playerSize * 3.2,
                            child: Text(
                              widget.playerNames.length >= 2
                                  ? widget.playerNames[1]
                                  : 'Player 2',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        if (widget.numberOfPlayers >= 4)
                          Positioned(
                            top: playerSize * 2.8,
                            right: 0.0,
                            child: Text(
                              widget.playerNames.length >= 4
                                  ? widget.playerNames[3]
                                  : 'Player 4',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        if (widget.numberOfPlayers >= 6)
                          Positioned(
                            bottom: playerSize * 1.4,
                            right: playerSize * 1.2,
                            child: Text(
                              widget.playerNames.isNotEmpty
                                  ? widget.playerNames[5]
                                  : 'Player 6',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        if (widget.numberOfPlayers >= 8)
                          Positioned(
                            bottom: playerSize * 1.4,
                            left: playerSize * 1.2,
                            child: Text(
                              widget.playerNames.isNotEmpty
                                  ? widget.playerNames[7]
                                  : 'Player 8',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              right: 70,
              child: ElevatedButton(
                onPressed: () {
                  playSound('sound/Bottlespin.mp3');
                  restartAnimation();
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(30),
                  // Adjust the padding as needed
                  backgroundColor: Colors.green, // Set the desired color here
                ),
                child: const Text('Spin'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
