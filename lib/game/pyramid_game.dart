import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class PyramidGame extends FlameGame with TapCallbacks {
  late Player player;
  late SpriteComponent door;

  @override
  Color backgroundColor() => const Color(0xFF0A0A0A);

  @override
  Future<void> onLoad() async {
    // 1. تحميل خلفية الهرم
    final bgImage = await Flame.images.load('assets/images/room_bg.png');
    add(
      SpriteComponent(
        sprite: Sprite(bgImage),
        size: size,
        priority: -10,
      ),
    );

    // 2. تحميل البطل
    final playerImage = await Flame.images.load('assets/images/player.png');
    player = Player(
      sprite: Sprite(playerImage),
      position: Vector2(size.x / 2, size.y * 0.7),
      size: Vector2(100, 140),
    );
    add(player);

    // 3. تحميل الباب
    final doorImage = await Flame.images.load('assets/images/door.png');
    door = SpriteComponent(
      sprite: Sprite(doorImage),
      position: Vector2(size.x / 2, size.y * 0.2),
      size: Vector2(100, 120),
      anchor: Anchor.center,
      priority: 5,
    );
    add(door);
  }

  @override
  void onTapDown(TapDownEvent event) {
    final tapPosition = event.localPosition;
    final direction = tapPosition - player.position;
    player.position += direction.normalized() * 40;
    
    if (player.position.x < 50) player.position.x = 50;
    if (player.position.x > size.x - 50) player.position.x = size.x - 50;
    if (player.position.y < 100) player.position.y = 100;
    if (player.position.y > size.y - 50) player.position.y = size.y - 50;
  }
}

class Player extends SpriteComponent {
  Player({
    required Sprite sprite,
    required Vector2 position,
    required Vector2 size,
  }) : super(
          sprite: sprite,
          position: position,
          size: size,
          anchor: Anchor.center,
        );
}