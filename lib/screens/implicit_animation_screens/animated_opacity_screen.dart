import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({super.key});

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  IconData _icon = CupertinoIcons.sun_max;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Opacity'),
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
            AnimatedOpacity(
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 1),
              opacity: _isSunIcon ? 1.0 : 0.5,
              child: Icon(
                _icon,
                size: _isSunIcon ? 150 : 100,
              ),
            ),
            AnimatedOpacity(
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 2),
              opacity: _isSunIcon ? 1.0 : 0.5,
              child: Icon(
                _icon,
                size: _isSunIcon ? 150 : 100,
              ),
            ),
            AnimatedOpacity(
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 3),
              opacity: _isSunIcon ? 1.0 : 0.5,
              child: Icon(
                _icon,
                size: _isSunIcon ? 150 : 100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get _isSunIcon => _icon == CupertinoIcons.sun_max;
}
