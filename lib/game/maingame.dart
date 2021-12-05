import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flamebird/Util/util.dart';
import 'package:flamebird/objs/bg.dart';
import 'package:flamebird/objs/bird.dart';
import 'package:flamebird/objs/coin.dart';
import 'package:flamebird/objs/ground.dart';
import 'package:flamebird/objs/pipe.dart';

class MainGame extends FlameGame with HasCollidables, TapDetector {
  Bg bg = Bg();
  Bg2 bg2 = Bg2();
  Ground ground = Ground();
  Ground2 ground2 = Ground2();
  Bird bird = Bird();

  Pipe pipe = Pipe("pipe2.png");
  Pipe pipe2 = Pipe("pipe1.png");

  Coin coin = Coin();

  @override
  Future<void>? onLoad() {
    add(bg);
    add(bg2);

    pipe.addHitbox(HitboxRectangle());
    add(pipe);
    pipe2.addHitbox(HitboxRectangle());
    add(pipe2);
    coin.addHitbox(HitboxRectangle());
    add(coin);

    ground.addHitbox(HitboxRectangle());
    add(ground);
    ground2.addHitbox(HitboxRectangle());
    add(ground2);

    bird.addHitbox(HitboxRectangle());
    add(bird);

    return super.onLoad();
  }

  gameOverPause() {
    if (gameOver) {
      overlays.add("endscreen");
      pauseEngine();
    }
  }

  @override
  void update(double dt) {
    pipe2.y = pipe.y + pipe.height + 200;
    coin.x = pipe.x + pipe.width / 2 - coin.width / 2;
    coin.y = pipe.y + pipe.height + 100 - coin.height / 2;

    gameOverPause();
    super.update(dt);
  }

  @override
  void onTap() {
    if (bird.y > 0) {
      bird.vel -= 12;
    } else {
      bird.y = 0;
    }

    super.onTap();
  }
}
