import 'package:flutter/material.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/animated_builder_screen.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/default_text_style_screen.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/fade_transition_screen.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/indexed_stack_screen.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/positioned_transition_screen.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/rotation_transition_screen.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/size_transition_screen.dart';
import 'package:flutter_animation_helper/screens/explicit_animation_screens/tween_animation_builder_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_align_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_container_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_cross_fade_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_default_text_style_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_list_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_opacity_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_padding_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_physical_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_position_directional_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_position_screen.dart';
import 'package:flutter_animation_helper/screens/implicit_animation_screens/animated_switcher_screen.dart';
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
              ///
              /// Implicit Animation
              ///
              Text(
                "Implicit Animation",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const NavigationElevatedButton(
                title: "Animated Align",
                screenWidget: AnimatedAlignScreen(),
              ),

              const NavigationElevatedButton(
                title: "Animated Container",
                screenWidget: AnimatedContainerScreen(),
              ),

              const NavigationElevatedButton(
                title: "Animated Default Text Style",
                screenWidget: AnimatedDefaultTextStyleScreen(),
              ),

              const NavigationElevatedButton(
                title: "Animated Opacity",
                screenWidget: AnimatedOpacityScreen(),
              ),

              const NavigationElevatedButton(
                title: "Animated Padding",
                screenWidget: AnimatedPaddingScreen(),
              ),

              const NavigationElevatedButton(
                title: "Animated Physical",
                screenWidget: AnimatedPhysicalScreen(),
              ),

              const NavigationElevatedButton(
                title: "Animated Positioned",
                screenWidget: AnimatedPositionScreen(),
              ),

              const NavigationElevatedButton(
                title: "Animated Position Directional",
                screenWidget: AnimatedPositionDirectionalScreen(),
              ),

              const NavigationElevatedButton(
                title: "Animated Cross Fade",
                screenWidget: AnimatedCrossFadeScreen(),
              ),

              const NavigationElevatedButton(
                title: "Animated Switcher",
                screenWidget: AnimatedSwitcherScreen(),
              ),

              const NavigationElevatedButton(
                title: "Animated List",
                screenWidget: AnimatedListScreen(),
              ),

              ///
              /// Animations Builder
              ///
              Text(
                "Animation Builders ",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const NavigationElevatedButton(
                title: "Animated Builder Transition",
                screenWidget: AnimatedBuilderScreen(),
              ),

              const NavigationElevatedButton(
                title: "Tween Animation Builder Transition",
                screenWidget: TweenAnimationBuilderScreen(),
              ),

              ///
              /// Explicit Animations
              ///
              Text(
                "Explicit Animation",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
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

              const NavigationElevatedButton(
                title: "Fade Transition Screen",
                screenWidget: FadeTransitionScreen(),
              ),

              const NavigationElevatedButton(
                title: "Default Text Style Transition",
                screenWidget: DefaultTextStyleScreen(),
              ),

              const NavigationElevatedButton(
                title: "Indexed Stack Transition",
                screenWidget: IndexedStackScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
