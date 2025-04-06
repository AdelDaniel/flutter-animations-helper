import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexedStackScreen extends StatefulWidget {
  const IndexedStackScreen({super.key});

  @override
  State<IndexedStackScreen> createState() => _IndexedStackScreenState();
}

class _IndexedStackScreenState extends State<IndexedStackScreen>
    with SingleTickerProviderStateMixin {
  static const _duration = Duration(seconds: 2);
  int _currentIndex = 0;
  late AnimationController _controller;
  late Tween<double> _doubleTween;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _doubleTween = Tween<double>(begin: 0.0, end: 1.0);

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
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
        title: const Text('Indexed Stack Screen'),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            _currentIndex = (_currentIndex + 1) % 3;
          });
          _controller.reset();
          _controller.forward();
        },
        child: Center(
          child: IndexedStack(
            alignment: Alignment.center,
            index: _currentIndex,
            children: <Widget>[
              RotationTransition(
                turns: _doubleTween.animate(_curvedAnimation),
                child: const Icon(CupertinoIcons.star, size: 400),
              ),
              FadeTransition(
                opacity: _doubleTween.animate(_curvedAnimation),
                child: const Icon(CupertinoIcons.moon_stars, size: 400),
              ),
              ScaleTransition(
                scale: _doubleTween.animate(_curvedAnimation),
                child: const Icon(CupertinoIcons.sun_max, size: 400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
