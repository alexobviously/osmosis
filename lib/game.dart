import 'package:flame/game.dart';
import 'package:flamejam/background.dart';
import 'package:flamejam/model/map_data.dart';

class MyGame extends FlameGame {
  @override
  Future<void>? onLoad() {
    super.onLoad();
    add(Background(size: Vector2(800, 600), data: MapData(128, 128)));
    return null;
  }
}
