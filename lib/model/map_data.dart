import 'dart:math';

import 'package:flamejam/model.dart';

class MapData {
  final int width;
  final int height;
  MapData(this.width, this.height);

  late final List<List<int>> _territory = List.generate(
    width,
    (i) => List.generate(height, (i) => 0),
  );
  List<List<int>> get territory => _territory;

  void setTerritory(Location loc, int value) {
    if (loc.x < 0 || loc.x >= width || loc.y < 0 || loc.y >= height) {
      return;
    }
    _territory[loc.x][loc.y] = value;
  }

  List<Location> squarePathBetween(Location start, Location end) {
    List<Location> path = [start];
    int i = 0;
    while (path.last != end && i++ < 1000) {
      int xd = end.x - path.last.x;
      int yd = end.y - path.last.y;
      if (yd.abs() > xd.abs()) {
        path.add(Location(path.last.x, path.last.y + yd.sign));
      } else {
        path.add(Location(path.last.x + xd.sign, path.last.y));
      }
    }
    return path;
  }
}
