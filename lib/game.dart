import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flamejam/background.dart';
import 'package:flamejam/entities/unit.dart';
import 'package:flamejam/model.dart';

class MyGame extends FlameGame
    with HasTappableComponents, HasCollisionDetection {
  MapData mapData = MapData(128, 128);
  Location lastClick = const Location(10, 10);
  final double tileSize = 16.0;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    add(Background(
      size: Vector2(mapData.width * tileSize, mapData.height * tileSize),
      tileSize: tileSize,
      data: mapData,
      onTap: _backgroundTap,
    ));
  }

  @override
  void update(double dt) {
    // mapData.setTerritory(Random().nextInt(mapData.width),
    //     Random().nextInt(mapData.height), Random().nextInt(2) + 1);
    super.update(dt);
  }

  void _backgroundTap(Location loc) {
    mapData.setTerritory(loc, 1);
    final path = mapData.orthogonalPath(lastClick, loc);
    lastClick = loc;
    for (Location l in path) {
      mapData.setTerritory(l, 1);
      add(
        Unit(
          radius: tileSize / 3,
          position: l.toPosition(tileSize),
          player: Player.blue,
        ),
      );
    }
  }
}
