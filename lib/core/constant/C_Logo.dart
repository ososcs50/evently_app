import 'package:animate_do/animate_do.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/material.dart';

class CLogo extends StatelessWidget {
  const CLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
            duration: Duration(milliseconds: 800),
            child: Hero(
              tag: 'app-logo',
              child: Image.asset(
                'assets/images/Logo_img.png',
                width: 130,
                height: 140,
              ),
            ),
          ),
          SizedBox(width: 5),
          FadeInUpBig(
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
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
