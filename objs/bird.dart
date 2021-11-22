import 'package:flame/components.dart';
import 'package:flappybird/Util/util.dart';
import 'package:flappybird/objs/ground.dart';
import 'package:flappybird/objs/obj.dart';

class Bird extends Obj {
  int grav = 1;
  int vel = 2;

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("bird1.png");
    size = Vector2(60, 50);
    return super.onLoad();
  }

  gravity() {
    if (vel <= 10) {
      vel += grav;
    }

    y += vel;
  }

  @override
  void update(double dt) {
    animation(8, 3, "bird");
    gravity();
    super.update(dt);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    position.x = 100;
    position.y = 100;
    super.onGameResize(gameSize);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is Ground || other is Ground2) {
      gameOver = true;
      y = other.y - height / 2;
    }
    super.onCollision(intersectionPoints, other);
  }
}
