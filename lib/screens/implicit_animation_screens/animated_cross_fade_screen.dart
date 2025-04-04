import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  const AnimatedCrossFadeScreen({super.key});

  @override
  State<AnimatedCrossFadeScreen> createState() =>
      _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  bool _isNight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Cross Fade'),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            _isNight = !_isNight;
          });
        },
        child: Center(
          child: AnimatedCrossFade(
            alignment: Alignment.center,
            crossFadeState:
                _isNight ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: const Icon(CupertinoIcons.sun_max, size: 100),
            duration: const Duration(seconds: 1),
            secondChild: const Icon(CupertinoIcons.moon_stars, size: 100),
          ),
        ),
      ),
    );
  }
}
