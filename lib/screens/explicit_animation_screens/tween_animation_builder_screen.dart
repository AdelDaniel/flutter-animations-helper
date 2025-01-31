import 'dart:math' as math show pi;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Replacement of Animated Builder and Animation with tween
class TweenAnimationBuilderScreen extends StatefulWidget {
  const TweenAnimationBuilderScreen({super.key});

  @override
  State<TweenAnimationBuilderScreen> createState() =>
      _TweenAnimationBuilderScreenState();
}

class _TweenAnimationBuilderScreenState
    extends State<TweenAnimationBuilderScreen> {
  static const _duration = Duration(seconds: 2);

  double _endValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Positioned Transition Screen'),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            _endValue = _endValue == 1.0 ? 0.0 : 1.0;
          });
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            /// Moon
            TweenAnimationBuilder<double>(
              duration: _duration,
              tween: Tween<double>(begin: 0, end: _endValue),
              builder: (context, value, child) {
                return PositionedDirectional(
                  start: value * 50,
                  bottom: value * 50,
                  child: const Icon(
                    CupertinoIcons.moon,
                    size: 100,
                  ),
                );
              },
            ),

            /// Star
            Align(
              alignment: Alignment.topLeft,
              child: TweenAnimationBuilder<Color?>(
                duration: _duration,
                curve: Curves.bounceInOut,
                tween: ColorTween(begin: Colors.red, end: Colors.blue),
                builder: (context, value, child) {
                  return Icon(
                    CupertinoIcons.star,
                    size: 100,
                    color: value,
                  );
                },
              ),
            ),

            /// heart
            Align(
              alignment: Alignment.center,
              child: TweenAnimationBuilder(
                duration: _duration,
                tween: Tween<double>(begin: 0, end: _endValue),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(
                      value * 100,
                      value * 100,
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
              child: TweenAnimationBuilder(
                duration: _duration,
                tween: Tween<double>(begin: 0, end: _endValue),
                builder: (context, value, child) {
                  return Transform.rotate(
                    angle: value * 2 * math.pi,
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
