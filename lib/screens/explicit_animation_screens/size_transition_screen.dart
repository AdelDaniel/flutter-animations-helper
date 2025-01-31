import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Don't forget Curve Animation
/// Sized Box above the builder
/// And the center Widget
class SizeTransitionScreen extends StatefulWidget {
  const SizeTransitionScreen({super.key});

  @override
  State<SizeTransitionScreen> createState() => _SizeTransitionScreenState();
}

class _SizeTransitionScreenState extends State<SizeTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _smileAnimation;
  late Animation<double> _heartAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _heartAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _smileAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
        title: const Text('Size Transition Screen'),
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
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              width: 400,
              height: 400,
              child: Center(
                child: SizeTransition(
                  sizeFactor: _heartAnimation,
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
                child: SizeTransition(
                  sizeFactor: _smileAnimation,
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
