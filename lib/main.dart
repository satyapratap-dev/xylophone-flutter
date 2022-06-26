import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _messangerKey = GlobalKey<ScaffoldMessengerState>();

    void playSound(int trackNumber) {
      // or as a local variable
      final player = AudioCache();

      // call this method when desired
      player.play('note$trackNumber.wav');

      final snackBar = SnackBar(
        content: const Text('Yay! A SnackBar!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _messangerKey.currentState?.showSnackBar(snackBar);
    }

    Expanded buildkey(Color color, int trackNum) {
      return Expanded(
        child: ElevatedButton(
          onPressed: (() {
            playSound(trackNum);
          }),
          child: Text(''),
          style: ElevatedButton.styleFrom(
            primary: color,
          ),
        ),
      );
    }

    return MaterialApp(
      scaffoldMessengerKey: _messangerKey,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildkey(Colors.red, 1),
              buildkey(Colors.orange, 2),
              buildkey(Colors.yellow, 3),
              buildkey(Colors.green, 4),
              buildkey(Colors.grey, 5),
              buildkey(Colors.blue, 6),
              buildkey(Colors.purple, 7),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ]),
      ),
    );
  }
}
