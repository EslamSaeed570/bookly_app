import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<double> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Read Free Books',
      textAlign: TextAlign.center,
    );
  }
}
