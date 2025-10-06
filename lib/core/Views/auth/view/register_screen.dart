import 'package:animate_do/animate_do.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/core/Views/auth/manger/authpro.dart';
import 'package:evently_app/core/widgets/Custom_text.dart';
import 'package:evently_app/core/constant/C_Logo.dart';
import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:evently_app/core/widgets/C_Btn.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CreateAcc extends StatelessWidget {
  const CreateAcc({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Appcolors.primary),
        ),
        centerTitle: true,
        title: Text(
          'Register',
          style: theme.textTheme.displayMedium!.copyWith(fontSize: 32),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
          child: ChangeNotifierProvider(
            create: (BuildContext context) => Authpro(),
            child: Consumer<Authpro>(
              builder: (BuildContext context, Authpro pro, Widget? child) =>
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        32.h,
                        CLogo(),
                        FadeInUpBig(
                          delay: Duration(seconds: 1),
                          duration: Duration(milliseconds: 800),
                          child: Column(
                            children: [
                              Form(
                                key: pro.CformKey,
                                child: Column(
                                  children: [
                                    24.h,
                                    C_TextFormFild(
                                      prefix: Icon(Icons.person),
                                      title: 'Name',
                                      con: pro.namecontrollor,
                                      validator: (String? p3) =>
                                          pro.namevalidtor(p3),
                                    ),
                                    24.h,
                                    C_TextFormFild(
                                      title: 'Email',
                                      prefix: Icon(Icons.email),
                                      con: pro.Cemailcontrollor,
                                      validator: (String? p1) =>
                                          pro.emailvalidtor(p1),
                                    ),
                                    24.h,
                                    C_TextFormFild(
                                      prefix: Icon(Icons.lock),
                                      obscureText: !pro.showpass,
                                      title: 'Password',
                                      con: pro.Cpasscontrollor,
                                      validator: (String? p2) =>
                                          pro.passvalidtor(p2),
                                      suffix: InkWell(
                                        onTap: pro.changeShow,
                                        borderRadius: BorderRadius.circular(50),
                                        splashColor: Colors.transparent,
                                        child: Icon(
                                          pro.showpass
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                      ),
                                    ),
                                    24.h,
                                    C_TextFormFild(
                                      prefix: Icon(Icons.lock),
                                      obscureText: !pro.showpass,
                                      title: 'RePassword',
                                      con: pro.Repasscontrollor,
                                      validator: (val) =>
                                          pro.Repassvalidtor(val),
                                      suffix: InkWell(
                                        onTap: pro.changeShow,
                                        borderRadius: BorderRadius.circular(50),
                                        splashColor: Colors.transparent,
                                        child: Icon(
                                          pro.showpass
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              24.h,
                              CustomBtn(
                                ontap: () {
                                  pro.CreateAcc(context);
                                },
                                text: 'Create Account',
                                isloading: pro.isloading,
                              ),
                              24.h,
                              Text.rich(
                                TextSpan(
                                  text: " Already Have Account ?",
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.pop(context),
                                      text: ' Login',
                                      style: theme.textTheme.displayMedium!
                                          .copyWith(
                                            fontStyle: FontStyle.italic,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Appcolors.primary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              24.h,

                              AnimatedToggleSwitch<String>.rolling(
                                onChanged: (value) {},
                                height: 35,
                                style: ToggleStyle(
                                  backgroundColor: Colors.transparent,
                                  borderColor: Appcolors.primary,
                                  indicatorColor: Appcolors.primary,
                                ),
                                iconList: [
                                  SvgPicture.asset('assets/icons/US.svg'),
                                  SvgPicture.asset('assets/icons/EG.svg'),
                                ],
                                current: 'En',
                                values: ['En', 'Eg'],
                              ),
                            ],
                          ),
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
