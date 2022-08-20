import 'package:flame/components.dart';
import 'package:flamejam/model/constants.dart';
import 'package:flamejam/model/map_data.dart';
import 'package:flutter/material.dart';

class Background extends PositionComponent {
  final double tileSize;
  final MapData data;

  Background({
    super.size,
    super.position,
    this.tileSize = 32.0,
    required this.data,
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
    // canvas.drawRect(size.toRect(), Paint()..color = Colours.red);
  }
}
