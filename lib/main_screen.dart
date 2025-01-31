import 'package:flutter/material.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/animation_builder_screen.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/positioned_transition_screen.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/rotation_transition_screen.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/size_transition_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_align_screen.dart';
import 'package:flutter_animation_helper/widgets/navigation_elevated_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animation Helper"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              /// Implicit Animation
              Text(
                "Implicit Animation",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const NavigationElevatedButton(
                title: "Animated Align",
                screenWidget: AnimatedAlignScreen(),
              ),

              /// Explicit Animations
              Text(
                "Explicit Animation",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const NavigationElevatedButton(
                title: "Animation Builder Transition",
                screenWidget: AnimationBuilderScreen(),
              ),

              const NavigationElevatedButton(
                title: "Positioned Transition",
                screenWidget: PositionedTransitionScreen(),
              ),

              const NavigationElevatedButton(
                title: "Size Transition",
                screenWidget: SizeTransitionScreen(),
              ),

              const NavigationElevatedButton(
                title: "Rotation Transition",
                screenWidget: RotationTransitionScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
