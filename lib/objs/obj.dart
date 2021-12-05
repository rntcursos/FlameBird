import 'dart:math';
import 'dart:ui';
import 'package:flame/components.dart';

class Obj extends SpriteComponent with HasHitboxes, Collidable {
  int timer = 0;
  int img = 1;
  String name = "";

  bool collide = false;
  bool visible = true;

  random(double min, double max) {
    var r = Random();
    return min + r.nextDouble() * (max - min);
  }

  animation(time, spritelimit, name) async {
    timer += 1;
    if (timer > time) {
      timer = 0;
      img += 1;
    }

    if (img > spritelimit) {
      img = 1;
    }

    sprite = await Sprite.load(name + img.toString() + ".png");
  }

  @override
  void render(Canvas canvas) {
    if (visible) {
      super.render(canvas);
    }
  }
}
