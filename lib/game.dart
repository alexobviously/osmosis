import 'dart:math';

import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flamejam/background.dart';
import 'package:flamejam/entities/unit.dart';
import 'package:flamejam/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyGame extends FlameGame
    with HasTappableComponents, HasCollisionDetection, KeyboardEvents {
  MapData mapData = MapData(128, 128);
  Location lastClick = const Location(10, 10);
  final double tileSize = 16.0;
  Vector2 cameraVector = Vector2(600, 600);
  int cameraMoveValue = 15;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    add(Background(
      size: Vector2(mapData.width * tileSize, mapData.height * tileSize),
      tileSize: tileSize,
      data: mapData,
      onTap: _backgroundTap,
    ));
    camera.followVector2(cameraVector);
    camera.worldBounds = Rect.fromLTWH(
      0,
      0,
      mapData.width * tileSize,
      mapData.height * tileSize,
    );
  }

  @override
  void update(double dt) {
    // mapData.setTerritory(Random().nextInt(mapData.width),
    //     Random().nextInt(mapData.height), Random().nextInt(2) + 1);
    camera.update(dt);
    super.update(dt);
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

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      cameraVector.setValues(
        cameraVector.x,
        min(cameraVector.y + cameraMoveValue,
            camera.worldBounds!.bottom - camera.viewport.canvasSize!.y / 2),
      );
      return KeyEventResult.handled;
    }

    if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      cameraVector.setValues(
        cameraVector.x,
        max(cameraVector.y - cameraMoveValue,
            camera.worldBounds!.top + camera.viewport.canvasSize!.y / 2),
      );
      return KeyEventResult.handled;
    }

    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      cameraVector.setValues(
          max(cameraVector.x - cameraMoveValue,
              camera.worldBounds!.left + camera.viewport.canvasSize!.x / 2),
          cameraVector.y);
      return KeyEventResult.handled;
    }

    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      cameraVector.setValues(
          min(cameraVector.x + cameraMoveValue,
              camera.worldBounds!.right - camera.viewport.canvasSize!.x / 2),
          cameraVector.y);
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }
}
