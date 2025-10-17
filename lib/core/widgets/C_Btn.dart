import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class CustomBtn extends StatelessWidget {
  bool isloading;
  final Function() ontap;
  final String text;
  Color color;
  CustomBtn({
    super.key,
    required this.ontap,
    required this.text,
    this.isloading = false,
    this.color = Appcolors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: color,
      onPressed: ontap,
      child: AnimatedCrossFade(
        firstChild: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Appcolors.light,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        secondChild: CupertinoActivityIndicator(color: Appcolors.light),
        crossFadeState: isloading
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}
