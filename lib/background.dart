import 'package:flame/components.dart';
import 'package:flamejam/model/constants.dart';
import 'package:flutter/material.dart';

class Background extends PositionComponent {
  final double tileSize;

  Background({
    super.size,
    super.position,
    this.tileSize = 32.0,
  });

  final Paint _paintRed = Paint()..color = Colours.red;
  final Paint _paintBlue = Paint()..color = Colours.blue;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    int xTiles = size.x ~/ tileSize;
    int yTiles = size.y ~/ tileSize;

    for (int x = 0; x < xTiles; x++) {
      for (int y = 0; y < yTiles; y++) {
        canvas.drawRect(
          Rect.fromLTWH(x * tileSize, y * tileSize, tileSize, tileSize),
          (x + y) % 1 == 0 ? _paintRed : _paintBlue,
        );
      }
    }
    // canvas.drawRect(size.toRect(), Paint()..color = Colours.red);
  }
}
