import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedAlignScreen extends StatefulWidget {
  const AnimatedAlignScreen({super.key});

  @override
  State<AnimatedAlignScreen> createState() => _AnimatedAlignScreenState();
}

class _AnimatedAlignScreenState extends State<AnimatedAlignScreen> {
  final _random = Random(2);
  Alignment _redAlignment = Alignment.topLeft;
  Alignment _blueAlignment = Alignment.topCenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align'),
      ),
      body: InkWell(
        onTap: () {
          final int x = _random.nextInt(3) - 1;
          final int y = _random.nextInt(3) - 1;
          setState(() {
            _redAlignment = Alignment(x.toDouble(), y.toDouble());
            _blueAlignment = Alignment(-x.toDouble(), -y.toDouble());
          });
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            AnimatedAlign(
              alignment: _blueAlignment,
              duration: const Duration(seconds: 1),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                width: 200,
                height: 200,
              ),
            ),
            AnimatedAlign(
              alignment: _redAlignment,
              duration: const Duration(seconds: 1),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
