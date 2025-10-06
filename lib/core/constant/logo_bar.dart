import 'package:animate_do/animate_do.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/material.dart';

class Logo_Bar extends StatelessWidget {
  const Logo_Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInLeftBig(
          duration: Duration(milliseconds: 800),
          child: Hero(
            tag: 'app-logo',
            child: Image.asset(
              'assets/images/Logo_img.png',
              width: 55,
              height: 65,
            ),
          ),
        ),
        SizedBox(width: 5),
        FadeInRightBig(
          duration: Duration(milliseconds: 900),
          child: Hero(
            tag: 'app-name',
            child: Material(
              color: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              child: Text(
                'Evently',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Appcolors.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
