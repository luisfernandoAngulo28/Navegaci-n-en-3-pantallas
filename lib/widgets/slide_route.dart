import 'package:flutter/material.dart';

PageRouteBuilder<T> slideRoute<T>(Widget page) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeInOut));
      return SlideTransition(
        position: tween.animate(animation),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 350),
  );
}
