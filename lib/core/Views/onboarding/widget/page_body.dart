import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  const PageBody({
    super.key,
    required this.theme,
    required this.img,
    required this.title,
    required this.sub,
  });

  final ThemeData theme;
  final String img, title, sub;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(img),
        40.h,
        Text(title, style: theme.textTheme.titleSmall),
        40.h,
        Text(sub, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}
