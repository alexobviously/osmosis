import 'package:flame/game.dart';
import 'package:flamejam/background.dart';

class MyGame extends FlameGame {
  @override
  Future<void>? onLoad() {
    super.onLoad();
    add(Background(size: Vector2(800, 600)));
    return null;
  }
}
