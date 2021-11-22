import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flappybird/objs/obj.dart';

class Pipe extends Obj {
  String image;

  Pipe(this.image);

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load(image);
    position = Vector2(600, random(-300, 0));
    size = Vector2(100, 360);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    x -= 100 * dt;
    if (x < -100) {
      removeFromParent();
    }
    super.update(dt);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    // TODO: implement onGameResize
    super.onGameResize(gameSize);
  }

  @override
  void onRemove() {
    print("Fui removido");
    super.onRemove();
  }
}
