import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class PlayerNameScreen extends StatefulWidget {
  final int numberOfPlayers;
  final String bottleImage;
  final ValueChanged<List<String>> onNamesSubmitted;
  final bool sound;

  const PlayerNameScreen({
    Key? key,
    required this.numberOfPlayers,
    required this.onNamesSubmitted,
    required this.bottleImage,
    required this.sound,

  }) : super(key: key);

  @override
  _PlayerNameScreenState createState() => _PlayerNameScreenState();
}

class _PlayerNameScreenState extends State<PlayerNameScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _nameControllers = [];
  final List<String> _namesList = [];
  final player = AudioPlayer();
  bool isPlaying = false;
  bool sound = false;
  late DatabaseHelper _databaseHelper;

  void playSound(String soundPath) async {
    if (sound && isPlaying) {
      await player.stop(); // Stop the currently playing sound
    }

    if (sound) {
      await player.play(AssetSource(soundPath)); // Play the specified sound
      isPlaying = true;
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _namesList.addAll(generateRandomNames(12));
    _nameControllers.addAll(
      List.generate(widget.numberOfPlayers, (_) => TextEditingController()),
    );
    sound = widget.sound;
    _databaseHelper = DatabaseHelper();
    assignplayerName();
  }

  List<String> generateRandomNames(int count) {
    final faker = Faker();
    final List<String> names = [];
    for (int i = 0; i < count; i++) {
      String name;
      do {
        name = faker.person.name();
      } while (name.length < 3 || name.length > 8);
      names.add(name);
    }
    return names;
  }

  void assignplayerName() async {
    for (int i = 0; i < widget.numberOfPlayers; i++) {
      String savedName = await _databaseHelper.getPlayerName(i + 1);
      if (savedName.isNotEmpty) {
        _nameControllers[i].text = savedName;
      }else {
        _nameControllers[i].text = _namesList[i];
      }
    }
  }


  void _submitNames(BuildContext context, List<String> playerNames) async {
    if (playerNames.every((name) => name.length <= 8)) {

      widget.onNamesSubmitted(playerNames);
      Navigator.pushReplacementNamed(
          context, '/game_screen'); // Navigate to game screen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Name length should not exceed 8 characters'),
        ),
      );
      playSound('assets/sound/error.wav');
    }
  }

  void _savePlayerName(int playerId, String playerName) async {
    await _databaseHelper.savePlayerName(playerId, playerName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove Title Bar
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4, // Adjust the opacity as desired (0.0 to 1.0)
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            // Set the desired padding from the top
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'These are the Default Names you can Update any Name',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      for (int i = 0; i < widget.numberOfPlayers; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300, // Specify the desired width here
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _nameControllers[i],
                                    decoration: InputDecoration(
                                      labelText: 'Player ${i + 1}',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 12.0,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a name';
                                      } else if (value.length > 8) {
                                        return 'Name length should not exceed 8 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    final playerName = _nameControllers[i].text;
                                    if (playerName.isNotEmpty) {
                                      _savePlayerName(i + 1, playerName);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Player name saved'),
                                        ),
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.save),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            playSound('assets/sound/gameclick.mp3');
                            List<String> playerNames = _nameControllers
                                .map((controller) => controller.text)
                                .toList();
                            _submitNames(context, playerNames);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please fill in all the fields'),
                              ),
                            );
                            playSound('assets/sound/error.wav');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.green, // Set the desired color here
                        ),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'player_names.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS players (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');
  }

  Future<void> savePlayerName(int playerId, String playerName) async {
    final db = await database;
    await db.insert(
      'players',
      {'id': playerId, 'name': playerName},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String> getPlayerName(int playerId) async {
    final db = await database;
    final maps = await db.query(
      'players',
      columns: ['name'],
      where: 'id = ?',
      whereArgs: [playerId],
    );
    if (maps.isNotEmpty) {
      return maps.first['name'] as String;
    } else {
      return '';
    }
  }
}
