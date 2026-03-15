import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Single controller that drives both scale and fade using intervals
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    // Scale: start small -> bigger -> settle
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween(
          begin: 0.6,
          end: 1.2,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 66,
      ),
      TweenSequenceItem<double>(
        tween: Tween(
          begin: 1.2,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 34,
      ),
    ]).animate(_controller);

    // Fade out at the end
    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.66, 1.0, curve: Curves.easeIn),
    ).drive(Tween(begin: 1.0, end: 0.0));

    _controller.forward();

    // When animation completes, navigate to HomeView
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // use microtask to avoid setState during build
        Future.microtask(() {
          context.go(AppRouter.home);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Image.asset(
              Assets.images.logo.path,
              width: 180,
              height: 180,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
