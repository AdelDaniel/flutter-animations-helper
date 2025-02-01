import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedPaddingScreen extends StatefulWidget {
  const AnimatedPaddingScreen({super.key});

  @override
  State<AnimatedPaddingScreen> createState() => _AnimatedPaddingScreenState();
}

class _AnimatedPaddingScreenState extends State<AnimatedPaddingScreen> {
  IconData _icon = CupertinoIcons.sun_max;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Padding'),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            _icon =
                _isSunIcon ? CupertinoIcons.moon_stars : CupertinoIcons.sun_max;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AnimatedPadding(
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 1),
              padding: EdgeInsets.all(_isSunIcon ? 15 : 25),
              child: Icon(_icon, size: 100),
            ),
            AnimatedPadding(
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 2),
              padding: EdgeInsets.all(_isSunIcon ? 15 : 25),
              child: Icon(_icon, size: 100),
            ),
            AnimatedPadding(
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 3),
              padding: EdgeInsets.all(_isSunIcon ? 15 : 25),
              child: Icon(_icon, size: 100),
            ),
          ],
        ),
      ),
    );
  }

  bool get _isSunIcon => _icon == CupertinoIcons.sun_max;
}
