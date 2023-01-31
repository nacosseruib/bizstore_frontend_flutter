import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
enum AnimationType { opacity, translateX }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('width', Tween<double>(begin: 0.0, end: 100.0),
          duration: const Duration(milliseconds: 700))
      ..tween('height', Tween<double>(begin: 300.0, end: 200.0),
          duration: const Duration(milliseconds: 700));

    return PlayAnimationBuilder<Movie>(
      tween: tween,
      duration: tween.duration, // use duration from MovieTween
      builder: (context, value, _) {
        return Container(
          width: value.get('width'),
          height: value.get('height'),
          color: Colors.yellow,
        );
      },
    );
  }
}