import 'package:evently_app/core/widgets/C_Btn.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomBtn(text: "Logout", ontap: () {}),
      ),
    );
  }
}
