import 'package:flame/game.dart';
import 'package:flappybird/game/maingame.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    GameWidget(
      game: MainGame(),
    ),
  );
}
