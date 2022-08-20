import 'dart:math';

import 'package:flame/game.dart';
import 'package:flamejam/background.dart';
import 'package:flamejam/model/map_data.dart';

class MyGame extends FlameGame {
  MapData mapData = MapData(128, 128);
  @override
  Future<void>? onLoad() {
    super.onLoad();
    double tileSize = 16.0;
    add(Background(
      size: Vector2(mapData.width * tileSize, mapData.height * tileSize),
      tileSize: tileSize,
      data: mapData,
    ));
    return null;
  }

  @override
  void update(double dt) {
    mapData.setTerritory(Random().nextInt(mapData.width),
        Random().nextInt(mapData.height), Random().nextInt(2) + 1);
    super.update(dt);
  }
}
