import 'package:evently_app/Views/auth/manger/authpro.dart';
import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:evently_app/core/widgets/C_Btn.dart';
import 'package:evently_app/core/widgets/Custom_text.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class Forgetpass extends StatelessWidget {
  const Forgetpass({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Authpro();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Forget Password',
            style: TextStyle(
              color: Appcolors.primary,
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
        ),
        body: Consumer<Authpro>(
          builder: (BuildContext context, pro, Widget? child) => SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset('assets/images/forgetpass.png'),
                    24.h,
                    Form(
                      key: pro.formKey,
                      child: C_TextFormFild(
                        title: 'Enter Your Email',
                        con: pro.Femailcontrollor,
                        validator: (val) => pro.emailvalidtor(val),
                      ),
                    ),
                    24.h,
                    CustomBtn(
                      isloading: pro.isloading,
                      ontap: () {
                        if (pro.formKey.currentState!.validate()) {
                          pro.ResetPass();
                        }
                      },
                      text: 'Reset Password',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
