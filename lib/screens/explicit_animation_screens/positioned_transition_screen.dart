import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PositionedTransitionScreen extends StatefulWidget {
  const PositionedTransitionScreen({super.key});

  @override
  State<PositionedTransitionScreen> createState() =>
      _PositionedTransitionScreenState();
}

class _PositionedTransitionScreenState extends State<PositionedTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _smileAnimation;
  late Animation<RelativeRect> _heartAnimation;
  late Animation<RelativeRect> _starAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _heartAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
      end: const RelativeRect.fromLTRB(200, 200, 0, 0),
    ).animate(_controller);

    _smileAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 300, 300, 0),
      end: const RelativeRect.fromLTRB(300, 0, 0, 300),
    ).animate(_controller);

    _starAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
      end: const RelativeRect.fromLTRB(0, 0, 300, 300),
    ).animate(_controller);
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
            PositionedTransition(
              rect: _starAnimation,
              child: const Icon(
                CupertinoIcons.star,
                size: 100,
              ),
            ),

            PositionedTransition(
              rect: _heartAnimation,
              child: const Icon(
                CupertinoIcons.heart,
                size: 100,
              ),
            ),

            /// Smile
            PositionedTransition(
              rect: _smileAnimation,
              child: const Icon(
                CupertinoIcons.smiley,
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
