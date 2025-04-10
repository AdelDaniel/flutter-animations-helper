import 'package:flutter/material.dart';

final Tween<double> _tweenAnimation = Tween<double>(begin: 0, end: 1);

class PageTransations {
  const PageTransations();

  /// Fade Transition
  static PageRouteBuilder getFadePageTransiton(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return Align(
          alignment: Alignment.center,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  /// Scale Transition
  static PageRouteBuilder getScalePageTransiton(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.bounceInOut,
        );

        final updatedAnimation = _tweenAnimation.animate(curvedAnimation);

        return ScaleTransition(
          scale: updatedAnimation,
          child: child,
        );
      },
    );
  }

  /// Scale Transition && Fade Builder
  static PageRouteBuilder getScaleFadePageTransiton(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 459),
      pageBuilder: (context, animation, secondaryAnimation) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.bounceInOut,
        );

        final updatedAnimation = _tweenAnimation.animate(curvedAnimation);

        return Align(
          alignment: Alignment.center,
          child: FadeTransition(opacity: updatedAnimation, child: page),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.bounceInOut,
        );

        final updatedAnimation = _tweenAnimation.animate(curvedAnimation);

        return ScaleTransition(
          scale: updatedAnimation,
          child: child,
        );
      },
    );
  }
}
