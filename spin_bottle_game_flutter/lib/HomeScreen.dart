import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spin_bottle_game_flutter/TruthDareScreen.dart';

import 'PlayerNameScreen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool status = false;
  AudioPlayer audioPlayer = AudioPlayer();
  double numberOfPlayers = 2;
  bool audio=true;
  String selectedBottleImage = 'assets/bottle.png';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();


  void playaudio(String audioPath) async {
    ByteData data = await rootBundle.load(audioPath);
    List<int> bytes = data.buffer.asUint8List();

    await audioPlayer.setAudioSource(
      AudioSource.uri(
        Uri.dataFromBytes(
          bytes,
          mimeType: 'audio/mpeg', // Change the mimeType based on the audio file type
        ),
        tag: {
          'album': 'Your Album',
          'title': 'Your Title',
          'artwork': null,
        },
      ),
      initialPosition: Duration.zero,
      preload: true,
    );

    if (audioPlayer.playing) {
      await audioPlayer.seek(Duration.zero);
    } else {
      await audioPlayer.play();
    }

    print('Audio played');
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
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.85,
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/1.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/1.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/2.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/2.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/3.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/3.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/4.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/4.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/5.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/5.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/6.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/6.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/7.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/7.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/8.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/8.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/9.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/9.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/10.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/10.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/11.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/11.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/12.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/12.png'), // Replace with your desired text
                ),
                GestureDetector(
                  onTap: () {
                    if (audio) {
                      playaudio("audio/PictureSelect.wav");
                    }
                    setState(() {
                      selectedBottleImage = 'assets/images/13.png';
                    });
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                      'assets/images/13.png'), // Replace with your desired text
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Conatct Us'),
          content: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 40,),
              Text('Email:ayeshahabib@gmail.com'),
              SizedBox(height: 20,),
              Text('Github:https://github.com/AyeshaHabib1')
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Handle save operation here
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                // Handle cancel operation here
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('assets/images/back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 30,
              right: 30,
              child: Align(
                alignment: Alignment.topRight,
                child: FlutterSwitch(
                  width: 115.0,
                  height: 40.0,
                  activeColor: Colors.pink,
                  valueFontSize: 25.0,
                  toggleSize: 45.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 8.0,
                  showOnOff: true,
                  onToggle: (val) {
                    setState(() {
                      status = val; // Update the switch state.
                      if (val) {
                        // Switch is turned ON, play audio.
                        playaudio('assets/audio/music.ogg');
                      } else {
                        // Switch is turned OFF, stop audio playback.
                        audioPlayer.stop();
                        print('Audio stopped');
                      }
                    });
                  },
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Select Number of Players:',
                    style:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    numberOfPlayers.toInt().toString(),
                    style: const TextStyle(
                        fontSize: 27, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: SliderTheme(
                      data: SliderThemeData(
                        thumbColor: Colors.pink,
                        activeTrackColor: Colors.pink.withOpacity(0.9),
                        inactiveTrackColor: Colors.black38.withOpacity(0.5),
                        trackHeight: 12,
                        // Increase track height
                        overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 32),
                        // Increase overlay size
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 14), // Increase thumb size
                      ),
                      child: Slider(
                        value: numberOfPlayers,
                        min: 2,
                        max: 8,
                        divisions: 6,
                        onChanged: (value) {
                          setState(() {
                            playaudio('assets/audio/gameclick.mp3');
                            numberOfPlayers = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (audio) {
                            playaudio("sound/gameclick.mp3");
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayerNameScreen(
                                numberOfPlayers: numberOfPlayers.round(),
                              ),
                            ),
                          ).then((value) {
                            // Do something with the player names
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          fixedSize: Size(200, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Simple Spin', style: TextStyle(fontSize: 25)),
                      ),
                      SizedBox(width: 30), // Add spacing between buttons
                      ElevatedButton(
                        onPressed: () {
                          if (audio) {
                            playaudio("audio/gameclick.mp3");
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TruthDareScreen()));
                          // Handle button 2 press
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            fixedSize: Size(200, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        ),
                        child: Text('Truth/Dare',style: TextStyle(fontSize: 25),),
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  MaterialButton(
                    color: Colors.pink,
                    hoverColor: Colors.grey,
                    height: 70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)
                    ),
                    onPressed: () {
                      if (audio) {
                        playaudio("audio/gameclick.mp3");
                      }
                      selectBottleImage();
                    },

                    child: const Text('Select An Image',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(onPressed: (){
                    _showContactDialog(context);
                  }, child: Text('CONTACT',style:TextStyle(fontSize: 20,color: Colors.white) ,))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


void main() => runApp(MaterialApp(
  home: HomeScreen(),
));

