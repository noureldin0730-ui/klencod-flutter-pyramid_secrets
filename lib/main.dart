import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/game.dart';

import 'game/pyramid_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const PyramidApp());
}

class PyramidApp extends StatelessWidget {
  const PyramidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "أسرار الأهرامات",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF0A0A0A),
        body: GameWidget(game: PyramidGame()),
      ),
    );
  }
}