import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedPositionDirectionalScreen extends StatefulWidget {
  const AnimatedPositionDirectionalScreen({super.key});

  @override
  State<AnimatedPositionDirectionalScreen> createState() =>
      _AnimatedPositionDirectionalScreenState();
}

class _AnimatedPositionDirectionalScreenState
    extends State<AnimatedPositionDirectionalScreen> {
  bool _isNight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Positioned Directional'),
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
              AnimatedPositionedDirectional(
                top: _isNight ? -100 : _centeredHeight,
                width: _isNight ? 300 : 10,
                curve: Curves.easeIn,
                duration: const Duration(seconds: 1),
                child: const Icon(CupertinoIcons.moon_stars, size: 100),
              ),
              AnimatedPositionedDirectional(
                bottom: _isNight ? _centeredHeight : -100,
                curve: Curves.easeIn,
                duration: const Duration(seconds: 1),
                child: const Icon(CupertinoIcons.sun_max, size: 100),
              ),
              AnimatedPositionedDirectional(
                start: _start,
                top: _top,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                child: const Icon(CupertinoIcons.star, size: 150),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _moveLeft,
                      child: const Icon(Icons.arrow_circle_left_outlined),
                    ),
                    ElevatedButton(
                      onPressed: _moveRight,
                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                    ElevatedButton(
                      onPressed: _moveUp,
                      child: const Icon(Icons.arrow_circle_up),
                    ),
                    ElevatedButton(
                      onPressed: _moveDown,
                      child: const Icon(Icons.arrow_circle_down),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double get _width => MediaQuery.of(context).size.width;
  double get _height => MediaQuery.of(context).size.height;
  double get _centeredHeight => (_height - kToolbarHeight) / 2;

  double _start = 0;
  double _top = 0;

  void _moveLeft() {
    setState(() {
      _start -= 50;
      if (_start < 0) {
        _start = 0;
      }
    });
  }

  void _moveRight() {
    setState(() {
      _start += 50;
      if (_start > _width - 120) {
        _start = _width - 120;
      }
    });
  }

  void _moveUp() {
    setState(() {
      _top -= 50;
      if (_top < 0) {
        _top = 0;
      }
    });
  }

  void _moveDown() {
    setState(() {
      _top += 50;
      if (_top > _height - 320) {
        _top = _height - 320;
      }
    });
  }
}
