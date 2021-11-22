import 'package:flame/components.dart';
import 'package:flappybird/objs/obj.dart';

class Ground extends Obj {
  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("ground.png");

    return super.onLoad();
  }

  @override
  void update(double dt) {
    x -= 100 * dt;
    if (x < -width) {
      x = 0;
    }
    super.update(dt);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    size.x = gameSize.x;
    size.y = gameSize.y / 4;
    position.y = gameSize.y - height;
    super.onGameResize(gameSize);
  }
}

class Ground2 extends Obj {
  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("ground.png");
    position.x = width;

    return super.onLoad();
  }

  @override
  void update(double dt) {
    x -= 100 * dt;
    if (x < 0) {
      x = width;
    }
    super.update(dt);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    size.x = gameSize.x;
    size.y = gameSize.y / 4;
    position.y = gameSize.y - height;
    super.onGameResize(gameSize);
  }
}
