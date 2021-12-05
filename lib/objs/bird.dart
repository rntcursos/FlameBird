import 'package:flame/components.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flamebird/Util/util.dart';
import 'package:flamebird/objs/coin.dart';
import 'package:flamebird/objs/ground.dart';
import 'package:flamebird/objs/obj.dart';
import 'package:flamebird/objs/pipe.dart';

class Bird extends Obj {
  int grav = 1;
  int vel = 2;

  late AudioPool colide;
  late AudioPool coin;

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("bird1.png");
    size = Vector2(60, 50);

    colide = await AudioPool.create("hit.ogg");
    coin = await AudioPool.create("point.ogg");
    return super.onLoad();
  }

  gravity() {
    if (vel <= 6) {
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
      colide.start();
    }

    if (other is Pipe) {
      gameOver = true;
      colide.start();
    }

    if (other is Coin) {
      if (other.visible) {
        coin.start();
      }
      other.visible = false;
    }

    super.onCollision(intersectionPoints, other);
  }
}
