import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedPhysicalScreen extends StatefulWidget {
  const AnimatedPhysicalScreen({super.key});

  @override
  State<AnimatedPhysicalScreen> createState() => _AnimatedPhysicalScreenState();
}

class _AnimatedPhysicalScreenState extends State<AnimatedPhysicalScreen> {
  IconData _icon = CupertinoIcons.sun_max;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Physical'),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            _icon =
                _isSunIcon ? CupertinoIcons.moon_stars : CupertinoIcons.sun_max;
          });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 25),
              AnimatedPhysicalModel(
                curve: Curves.easeInOut,
                duration: const Duration(seconds: 1),
                color: Colors.yellow[800]!,
                shadowColor: _isSunIcon ? Colors.red : Colors.blue,
                child: Icon(_icon, size: 100),
              ),
              const SizedBox(height: 25),
              AnimatedPhysicalModel(
                curve: Curves.easeInOut,
                duration: const Duration(seconds: 1),
                color: _isSunIcon ? Colors.yellow[800]! : Colors.green[800]!,
                shadowColor: Colors.blue,
                child: Icon(_icon, size: 100),
              ),
              const SizedBox(height: 25),
              AnimatedPhysicalModel(
                curve: Curves.easeInOut,
                duration: const Duration(seconds: 2),
                color: Colors.yellow[800]!,
                shadowColor: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: _isSunIcon
                    ? const BorderRadius.all(Radius.circular(150))
                    : const BorderRadius.all(Radius.circular(25)),
                child: Icon(_icon, size: 100),
              ),
              const SizedBox(height: 25),
              AnimatedPhysicalModel(
                curve: Curves.easeInOut,
                duration: const Duration(seconds: 2),
                color: Colors.yellow[800]!,
                shadowColor: Colors.blue,
                shape: BoxShape.rectangle,
                elevation: _isSunIcon ? 100 : 0,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Icon(_icon, size: 100),
              ),
              const SizedBox(height: 25),
              AnimatedPhysicalModel(
                curve: Curves.easeInOut,
                duration: const Duration(seconds: 2),
                color: _isSunIcon ? Colors.yellow[800]! : Colors.green[800]!,
                shadowColor: _isSunIcon ? Colors.red : Colors.blue,
                shape: BoxShape.rectangle,
                elevation: _isSunIcon ? 50 : 0,
                borderRadius: _isSunIcon
                    ? const BorderRadius.all(Radius.circular(150))
                    : const BorderRadius.all(Radius.circular(25)),
                child: Icon(_icon, size: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get _isSunIcon => _icon == CupertinoIcons.sun_max;
}
