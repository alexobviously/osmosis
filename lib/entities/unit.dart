import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flamejam/model/constants.dart';
import 'package:flutter/material.dart';

class Unit extends PositionComponent with CollisionCallbacks {
  final double radius;
  final int player;

  late final Paint _stroke = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0
    ..color = Colours.fromType(player);
  late final Paint _fill = Paint()
    ..style = PaintingStyle.fill
    ..color = Colours.fromType(Player.opponent(player));

  Unit({
    required this.radius,
    this.player = Player.empty,
    required Vector2 position,
  }) : super(position: position, size: Vector2.all(radius * 2));

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    add(CircleHitbox(radius: radius));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(Offset.zero, radius, _fill);
    canvas.drawCircle(Offset.zero, radius, _stroke);
  }

  @override
  void update(double dt) {
    position += Vector2.random() * (Random().nextDouble() - 0.5);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is ScreenHitbox) {
      //
    } else if (other is Unit) {
      position += Vector2(
        (position.x - other.position.x) * 0.1,
        (position.y - other.position.y) * 0.1,
      );
    }
    super.onCollision(intersectionPoints, other);
  }
}
