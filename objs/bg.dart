import 'package:flame/components.dart';
import 'package:flappybird/objs/obj.dart';

class Bg extends Obj {
  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("sky.png");
    position = Vector2.all(0);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    x -= 60 * dt;
    if (x < -width) {
      x = 0;
    }
    super.update(dt);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    size = gameSize;
    super.onGameResize(gameSize);
  }
}

class Bg2 extends Obj {
  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("sky.png");
    position = Vector2(width, 0);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    x -= 60 * dt;
    if (x < 0) {
      x = width;
    }
    super.update(dt);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    size = gameSize;
    super.onGameResize(gameSize);
  }
}
