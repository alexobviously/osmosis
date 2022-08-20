import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flamejam/background.dart';
import 'package:flamejam/model.dart';

class MyGame extends FlameGame with HasTappableComponents {
  MapData mapData = MapData(128, 128);
  Location lastClick = Location(10, 10);
  @override
  Future<void> onLoad() async {
    super.onLoad();
    double tileSize = 16.0;
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
    print('ontap $loc');
    mapData.setTerritory(loc, 1);
    final path = mapData.squarePathBetween(lastClick, loc);
    print(path);
    lastClick = loc;
    for (Location l in path) {
      mapData.setTerritory(l, 2);
    }
  }
}
