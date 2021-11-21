import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flappybird/objs/bg.dart';
import 'package:flappybird/objs/bird.dart';
import 'package:flappybird/objs/ground.dart';

class MainGame extends FlameGame with HasCollidables, TapDetector {
  Bg bg = Bg();
  Bg2 bg2 = Bg2();
  Ground ground = Ground();
  Ground2 ground2 = Ground2();
  Bird bird = Bird();

  @override
  Future<void>? onLoad() {
    add(bg);
    add(bg2);

    ground.addHitbox(HitboxRectangle());
    add(ground);

    ground2.addHitbox(HitboxRectangle());
    add(ground2);

    bird.addHitbox(HitboxRectangle());
    add(bird);

    return super.onLoad();
  }

  @override
  void update(double dt) {
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
