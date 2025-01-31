import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotationTransitionScreen extends StatefulWidget {
  const RotationTransitionScreen({super.key});

  @override
  State<RotationTransitionScreen> createState() =>
      _RotationTransitionScreenState();
}

class _RotationTransitionScreenState extends State<RotationTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _smileAnimation;
  late Animation<double> _heartAnimation;

  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _heartAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    _smileAnimation = Tween<double>(
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
        title: const Text('Rotation Transition Screen'),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            if (_isAnimating) {
              _controller.stop();
            } else {
              _controller.repeat();
            }
            _isAnimating = !_isAnimating;
          });
        },
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              width: 400,
              height: 400,
              child: Center(
                child: RotationTransition(
                  turns: _heartAnimation,
                  child: const Icon(
                    CupertinoIcons.heart,
                    size: 400,
                  ),
                ),
              ),
            ),

            /// Smile
            SizedBox(
              width: 400,
              height: 400,
              child: Center(
                child: RotationTransition(
                  turns: _smileAnimation,
                  child: const Icon(
                    CupertinoIcons.smiley,
                    size: 400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
