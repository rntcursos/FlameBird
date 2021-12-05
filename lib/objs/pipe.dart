import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flamebird/objs/obj.dart';

class Pipe extends Obj {
  String image;

  Pipe(this.image);

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load(image);
    position = Vector2(600, random(-200, 0));
    size = Vector2(100, 360);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    x -= 100 * dt;
    if (x < -100) {
      x = 600;
      y = random(-200, 0);
    }
    super.update(dt);
  }

  @override
  void onRemove() {
    // ignore: avoid_print
    print("Fui removido");
    super.onRemove();
  }
}
