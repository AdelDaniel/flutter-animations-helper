import 'package:flutter/material.dart';

class DefaultTextStyleScreen extends StatefulWidget {
  const DefaultTextStyleScreen({super.key});

  @override
  State<DefaultTextStyleScreen> createState() => _DefaultTextStyleScreenState();
}

class _DefaultTextStyleScreenState extends State<DefaultTextStyleScreen>
    with SingleTickerProviderStateMixin {
  static const _duration = Duration(seconds: 2);
  late AnimationController _controller;
  late TextStyleTween _styleTween;
  late CurvedAnimation _curvedAnimation;

  static const TextStyle _style1 =
      TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold);
  static const TextStyle _style2 =
      TextStyle(fontSize: 36, color: Colors.red, fontWeight: FontWeight.normal);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _styleTween = TextStyleTween(begin: _style1, end: _style2);

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Positioned Transition Screen'),
      ),
      body: InkWell(
        onTap: () {
          _controller.status == AnimationStatus.completed
              ? _controller.reverse()
              : _controller.forward();
        },
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            DefaultTextStyleTransition(
              style: _styleTween.animate(_curvedAnimation),
              child: const Text("Yes we can animate styles"),
            ),
          ],
        ),
      ),
    );
  }
}
