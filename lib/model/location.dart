import 'package:flame/extensions.dart';

class Location {
  final int x;
  final int y;
  const Location(this.x, this.y);

  Vector2 toPosition(double tileSize) =>
      Vector2(x * tileSize + tileSize / 2, y * tileSize + tileSize / 2);

  @override
  bool operator ==(Object other) =>
      other is Location && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => '($x, $y)';
}
