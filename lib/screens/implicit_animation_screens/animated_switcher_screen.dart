import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcherScreen extends StatefulWidget {
  const AnimatedSwitcherScreen({super.key});

  @override
  State<AnimatedSwitcherScreen> createState() => _AnimatedSwitcherScreenState();
}

class _AnimatedSwitcherScreenState extends State<AnimatedSwitcherScreen> {
  bool _isNight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Switcher'),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            _isNight = !_isNight;
          });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedSwitcher(
                switchInCurve: Curves.easeIn,
                duration: const Duration(seconds: 1),
                reverseDuration: const Duration(seconds: 1),
                child: _isNight
                    ? const Icon(
                        CupertinoIcons.moon_stars,
                        key: ValueKey('moon'),
                        size: 100,
                      )
                    : const Icon(
                        CupertinoIcons.sun_max,
                        key: ValueKey('sun'),
                        size: 100,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
