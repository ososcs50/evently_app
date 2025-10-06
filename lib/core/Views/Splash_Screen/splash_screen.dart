import 'package:animate_do/animate_do.dart';
import 'package:evently_app/core/route/approute.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              FadeInDownBig(
                duration: Duration(seconds: 1),
                child: Hero(
                  tag: 'app-logo',
                  child: Image.asset('assets/images/Logo_img.png'),
                ),
              ),
              FadeInRightBig(
                delay: Duration(seconds: 1),
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
              Spacer(),
              FadeInUpBig(
                onFinish: (direction) {
                  return Navigator.pushReplacementNamed(
                    context,
                    ApprouteName.start,
                  );
                },

                delay: Duration(seconds: 2),
                duration: Duration(milliseconds: 500),
                child: Image.asset('assets/images/route_img.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
