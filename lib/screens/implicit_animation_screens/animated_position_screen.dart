import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedPositionScreen extends StatefulWidget {
  const AnimatedPositionScreen({super.key});

  @override
  State<AnimatedPositionScreen> createState() => _AnimatedPositionScreenState();
}

class _AnimatedPositionScreenState extends State<AnimatedPositionScreen> {
  bool _isNight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Positioned'),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            _isNight = !_isNight;
          });
        },
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              AnimatedPositioned(
                top: _isNight ? -100 : _centeredHeight,
                width: _isNight ? 300 : 10,
                curve: Curves.easeIn,
                duration: const Duration(seconds: 1),
                child: const Icon(CupertinoIcons.moon_stars, size: 100),
              ),
              AnimatedPositioned(
                bottom: _isNight ? _centeredHeight : -100,
                curve: Curves.easeIn,
                duration: const Duration(seconds: 1),
                child: const Icon(CupertinoIcons.sun_max, size: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double get _centeredHeight =>
      (MediaQuery.of(context).size.height - kToolbarHeight) / 2;
}
