import 'package:flutter/material.dart';

class VideoCircleImageAnimation extends StatefulWidget {
  VideoCircleImageAnimation({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  _VideoCircleImageAnimationState createState() => _VideoCircleImageAnimationState();
}

class _VideoCircleImageAnimationState extends State<VideoCircleImageAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.forward();
    _controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
        child: widget.child);
  }
}
