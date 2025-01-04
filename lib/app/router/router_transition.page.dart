import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageTransition<T extends Widget> extends CustomTransitionPage<T> {
  final T page;

  PageTransition({
    super.key,
    required this.page,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: const Offset(0, 0),
              ).animate(
                animation,
              ),
              child: child,
            );
          },
          child: page,
        );
}
