import 'package:flashcard/configs/constants.dart';
import 'package:flashcard/enum/slide_direction.dart';
import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation(
      {super.key,
      required this.child,
      required this.direction,
      required this.animate,
      this.reset,
      this.animationCompleted});

  final Widget child;
  final SlideDirection direction;
  final bool animate;
  final bool? reset;
  final VoidCallback? animationCompleted;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: kSlideAwayDuration),
    )..addListener(() {
        if (_animationController.status == AnimationStatus.completed) {
          widget.animationCompleted?.call();
        }
      });

    if (widget.animate) {
      _animationController.forward();
    }
    super.initState();
  }

  @override
  didUpdateWidget(SlideAnimation oldWidget) {
    if (widget.reset!) {
      _animationController.reset();
    }
    if (widget.animate) {
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final Animation<Offset> animation;
    Tween<Offset> tween;

    switch (widget.direction) {
      case SlideDirection.leftAway:
        tween = Tween<Offset>(
            begin: const Offset(0.0, 0.0), end: const Offset(-1.0, 0.0));
        break;

      case SlideDirection.rightAway:
        tween = Tween<Offset>(
            begin: const Offset(0.0, 0.0), end: const Offset(1.0, 0.0));
        break;

      case SlideDirection.leftIn:
        tween = Tween<Offset>(
            begin: const Offset(-1.0, 0.0), end: const Offset(0.0, 0.0));
        break;
      case SlideDirection.rightIn:
        tween = Tween<Offset>(
            begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0));
        break;

      case SlideDirection.upIn:
        tween = Tween<Offset>(
            begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0));
        break;
      case SlideDirection.none:
        tween = Tween<Offset>(
            begin: const Offset(0.0, 0.0), end: const Offset(0.0, 0.0));
        break;
    }

    animation = tween.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }
}
