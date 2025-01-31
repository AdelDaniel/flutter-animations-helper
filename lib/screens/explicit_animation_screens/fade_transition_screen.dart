import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FadeTransitionScreen extends StatefulWidget {
  const FadeTransitionScreen({super.key});

  @override
  State<FadeTransitionScreen> createState() => _FadeTransitionScreenState();
}

class _FadeTransitionScreenState extends State<FadeTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _smileAnimation;
  late Animation<double> _heartAnimation;
  late Animation<double> _starAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _heartAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    _smileAnimation = Tween<double>(
      begin: 0.1,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));

    _starAnimation = Tween<double>(
      begin: 1,
      end: 0,
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
        title: const Text('Fade Transition Screen'),
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
            FadeTransition(
              opacity: _starAnimation,
              child: const Icon(
                CupertinoIcons.star,
                size: 100,
              ),
            ),

            FadeTransition(
              opacity: _heartAnimation,
              child: const Icon(
                CupertinoIcons.heart,
                size: 100,
              ),
            ),

            /// Smile
            Align(
              alignment: Alignment.topCenter,
              child: FadeTransition(
                opacity: _smileAnimation,
                child: const Icon(
                  CupertinoIcons.smiley,
                  size: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
