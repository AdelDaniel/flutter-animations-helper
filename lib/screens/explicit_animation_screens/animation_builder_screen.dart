import 'dart:math' as math show pi;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationBuilderScreen extends StatefulWidget {
  const AnimationBuilderScreen({super.key});

  @override
  State<AnimationBuilderScreen> createState() => _AnimationBuilderScreenState();
}

class _AnimationBuilderScreenState extends State<AnimationBuilderScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Positioned Transition Screen'),
      ),
      body: InkWell(
        onTap: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _controller.value + 1,
                    child: const Icon(
                      CupertinoIcons.star,
                      size: 100,
                    ),
                  );
                },
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      _controller.value * 100,
                      _controller.value * 100,
                    ),
                    child: const Icon(
                      CupertinoIcons.heart,
                      size: 100,
                    ),
                  );
                },
              ),
            ),

            /// Smile
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: const Icon(
                      CupertinoIcons.smiley,
                      size: 100,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
