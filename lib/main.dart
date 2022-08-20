import 'package:flamejam/game.dart';
import 'package:flutter/material.dart';

import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

void main() {
  final game = MyGame();
  runApp(GameWidget(game: game));
}
