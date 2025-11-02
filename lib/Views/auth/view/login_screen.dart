import 'package:animate_do/animate_do.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/Views/auth/manger/authpro.dart';
import 'package:evently_app/core/constant/C_Logo.dart';
import 'package:evently_app/core/constant/extension/nav.dart';
import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/route/approute.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:evently_app/core/widgets/C_Btn.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
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
                                key: pro.formKey,
                                child: Column(
                                  children: [
                                    24.h,
                                    TextFormField(
                                      validator: (value) =>
                                          pro.emailvalidtor(value),
                                      controller: pro.emailcontrollor,
                                      cursorColor: Colors.black54,
                                      cursorHeight: 25,
                                      onTapOutside: (event) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        prefixIcon: Icon(Icons.email),
                                      ),
                                    ),
                                    24.h,
                                    TextFormField(
                                      validator: (value) =>
                                          pro.passvalidtor(value),
                                      controller: pro.passcontrollor,
                                      obscureText: !pro.showpass,
                                      cursorColor: Appcolors.primary,
                                      cursorHeight: 25,
                                      onTapOutside: (event) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: InkWell(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          splashColor: Colors.transparent,
                                          onTap: pro.changeShow,
                                          child: Icon(
                                            pro.showpass
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),
                                        labelText: 'Password',
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              8.h,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    overlayColor: WidgetStatePropertyAll(
                                      Colors.transparent,
                                    ),
                                    onTap: () {
                                      context.go(ApprouteName.forgetpass);
                                    },
                                    child: Text(
                                      'Forget Password?',
                                      style: theme.textTheme.displayMedium!
                                          .copyWith(
                                            fontStyle: FontStyle.italic,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Appcolors.primary,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              24.h,
                              CustomBtn(
                                ontap: () {
                                  if (pro.formKey.currentState!.validate()) {
                                    pro.login(context);
                                  }
                                },
                                text: 'Login',
                                isloading: pro.isloading,
                              ),
                              24.h,
                              Text.rich(
                                TextSpan(
                                  text: "Dont You Have Account ?",
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.pushNamed(
                                          context,
                                          ApprouteName.register,
                                        ),
                                      text: ' Create Account',
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
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      indent: 24,
                                      endIndent: 24,
                                      color: Appcolors.primary,
                                      height: 2,
                                    ),
                                  ),
                                  Text(
                                    'Or',
                                    style: TextStyle(color: Appcolors.primary),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      indent: 24,
                                      endIndent: 24,
                                      color: Appcolors.primary,
                                      height: 2,
                                    ),
                                  ),
                                ],
                              ),
                              24.h,
                              GestureDetector(
                                onTap: () => pro.googlelogin(context),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 12),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Appcolors.primary,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/google_svg.svg',
                                      ),
                                      8.w,
                                      Text(
                                        'Login With Google',
                                        style: theme.textTheme.displayMedium!
                                            .copyWith(fontSize: 20),
                                      ),
                                    ],
                                  ),
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
