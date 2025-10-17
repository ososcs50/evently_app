import 'package:animate_do/animate_do.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/constant/logo_bar.dart';
import 'package:evently_app/core/manger/app_provider.dart';
import 'package:evently_app/core/route/approute.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:evently_app/core/widgets/C_Btn.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var applocal = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var pro = Provider.of<AppProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Logo_Bar(),
              Expanded(
                child: FadeInUpBig(
                  delay: Duration(seconds: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 28),
                      Expanded(
                        flex: 5,
                        child: Image.asset('assets/images/onboarding_1.png'),
                      ),
                      SizedBox(height: 28),
                      Text(
                        textAlign: TextAlign.start,
                        'Personalize Your Experience',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Appcolors.primary,
                        ),
                      ),
                      28.h,
                      Text(
                        'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                        style: theme.textTheme.bodyMedium,
                      ),
                      28.h,
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Language',
                              style: TextStyle(
                                color: Appcolors.primary,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            AnimatedToggleSwitch<String>.rolling(
                              onChanged: (value) => pro.changeLocal(value),
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
                              current: pro.local,
                              values: ['en', 'ar'],
                            ),
                          ],
                        ),
                      ),
                      28.h,
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Theme',
                              style: TextStyle(
                                color: Appcolors.primary,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            AnimatedToggleSwitch<ThemeMode>.rolling(
                              onChanged: (value) => pro.changeTheme(value),
                              current: pro.tm,
                              height: 35,
                              style: ToggleStyle(
                                backgroundColor: Colors.transparent,
                                borderColor: Appcolors.primary,
                                indicatorColor: Appcolors.primary,
                              ),
                              values: [ThemeMode.light, ThemeMode.dark],
                              iconList: [
                                SvgPicture.asset(
                                  'assets/icons/Sun.svg',
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/icons/Moon.svg',
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      28.h,
                      Center(
                        child: CustomBtn(
                          ontap: () => Navigator.pushReplacementNamed(
                            context,
                            ApprouteName.onboarding,
                          ),
                          text: 'Let’s Start',
                          isloading: false,
                        ),
                      ),
                      10.h,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
