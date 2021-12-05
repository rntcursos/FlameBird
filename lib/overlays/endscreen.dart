import 'package:flamebird/Util/util.dart';
import 'package:flamebird/game/maingame.dart';
import 'package:flamebird/main.dart';
import 'package:flutter/material.dart';

Widget endScreen(BuildContext context, MainGame game) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.max,
    children: [
      Image.asset("assets/images/gameover.png"),
      GestureDetector(
        onTap: () {
          gameOver = false;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StartScreen(),
            ),
          );
        },
        child: Image.asset("assets/images/go.png"),
      )
    ],
  );
}
