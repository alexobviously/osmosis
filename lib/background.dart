import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flamejam/model.dart';
import 'package:flutter/material.dart';

class Background extends PositionComponent with TapCallbacks {
  final double tileSize;
  final MapData data;
  final void Function(Location) onTap;

  Background({
    super.size,
    super.position,
    this.tileSize = 8.0,
    required this.data,
    required this.onTap,
  });

  final Paint _paintRed = Paint()..color = Colours.red;
  final Paint _paintBlue = Paint()..color = Colours.blue;
  final Paint _paintBlack = Paint()..color = Colours.black;

  Paint _paintForType(int type) => type == SquareType.blue
      ? _paintBlue
      : type == SquareType.red
          ? _paintRed
          : _paintBlack;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    int xTiles = size.x ~/ tileSize;
    int yTiles = size.y ~/ tileSize;

    for (int x = 0; x < xTiles; x++) {
      for (int y = 0; y < yTiles; y++) {
        canvas.drawRect(
          Rect.fromLTWH(x * tileSize, y * tileSize, tileSize, tileSize),
          _paintForType(data.territory[x][y]),
        );
      }
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    final loc = Location(
      event.localPosition.x ~/ tileSize,
      event.localPosition.y ~/ tileSize,
    );
    onTap(loc);
    super.onTapDown(event);
  }
}
