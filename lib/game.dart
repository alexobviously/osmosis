import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flamejam/background.dart';
import 'package:flamejam/model/map_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyGame extends FlameGame with KeyboardEvents {
  MapData mapData = MapData(128, 128);
  Vector2 cameraVector = Vector2(600, 600);
  int cameraMoveValue = 15;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    double tileSize = 16.0;
    add(Background(
      size: Vector2(mapData.width * tileSize, mapData.height * tileSize),
      tileSize: tileSize,
      data: mapData,
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
    mapData.setTerritory(Random().nextInt(mapData.width),
        Random().nextInt(mapData.height), Random().nextInt(2) + 1);
    camera.update(dt);
    super.update(dt);
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
