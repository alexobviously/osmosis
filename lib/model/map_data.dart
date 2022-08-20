import 'dart:math';

class MapData {
  final int width;
  final int height;
  MapData(this.width, this.height);

  late final List<List<int>> _territory = List.generate(
    width,
    (i) => List.generate(height, (i) => 0),
  );
  List<List<int>> get territory => _territory;

  void setTerritory(int x, int y, int value) {
    _territory[x][y] = value;
  }
}
