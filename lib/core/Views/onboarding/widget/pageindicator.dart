import 'package:flutter/material.dart';
import 'package:evently_app/core/theme/appcolors.dart';

class PageIndicator extends StatelessWidget {
  final bool isActive;
  const PageIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 10,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        color: isActive
            ? Appcolors.primary
            : Appcolors.primary.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
