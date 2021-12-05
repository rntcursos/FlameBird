import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flamebird/game/maingame.dart';
import 'package:flamebird/overlays/endscreen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding();
  Flame.device.fullScreen();
  runApp(
    const MaterialApp(
      home: StartScreen(),
    ),
  );
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameWidget(
                  game: MainGame(),
                  overlayBuilderMap: const {"endscreen": endScreen},
                ),
              ),
            );
          },
          child: Image.asset(
            "assets/images/startscreen.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
