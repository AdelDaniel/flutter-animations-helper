import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  IconData _icon = CupertinoIcons.sun_max;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            _icon =
                _isSunIcon ? CupertinoIcons.moon_stars : CupertinoIcons.sun_max;
          });
        },
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
                curve: Curves.bounceInOut,
                duration: const Duration(seconds: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: _isSunIcon
                      ? const BorderRadius.all(Radius.circular(100))
                      : const BorderRadius.all(Radius.circular(20)),
                  color: _isSunIcon ? Colors.red : Colors.blue,
                ),
                width: _isSunIcon ? 150 : 200,
                height: _isSunIcon ? 150 : 200,
                padding:
                    _isSunIcon ? EdgeInsets.zero : const EdgeInsets.all(20),
                child: Icon(
                  _icon,
                  size: _isSunIcon ? 150 : 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get _isSunIcon => _icon == CupertinoIcons.sun_max;
}
