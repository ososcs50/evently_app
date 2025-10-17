import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/manger/app_provider.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:evently_app/core/widgets/C_Btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class LayoutProfile extends StatelessWidget {
  const LayoutProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var pro = Provider.of<AppProvider>(context);
    var user = FirebaseAuth.instance.currentUser;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: pro.tm == ThemeMode.light
                  ? Appcolors.primary
                  : Appcolors.dark,
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(64),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(16),
                      topEnd: Radius.circular(360),
                      bottomEnd: Radius.circular(360),
                      bottomStart: Radius.circular(360),
                    ),
                    child: Image.asset(
                      'assets/images/route_logo.jpg',
                      height: 150,
                    ),
                  ),
                  24.w,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          user?.displayName ?? '',
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontSize: 34,
                            color: Appcolors.light,
                          ),
                        ),
                        Text(
                          user?.email ?? '',

                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Appcolors.light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          24.h,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    'Language',
                    style: theme.textTheme.bodyLarge,
                  ),
                  12.h,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1.5, color: Appcolors.primary),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: DropdownButton(
                        dropdownColor: Appcolors.light.withAlpha(200),
                        iconSize: 32,
                        icon: Icon(Iconsax.arrow_bottom_bold),
                        iconEnabledColor: Appcolors.primary,
                        underline: 0.h,
                        borderRadius: BorderRadius.circular(16),
                        isExpanded: true,
                        value: pro.English ? 'en' : 'ar',
                        onChanged: (value) {},
                        items: [
                          DropdownMenuItem(
                            value: "ar",
                            child: Text(
                              'Arabic',
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: Appcolors.primary,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "en",
                            child: Text(
                              'English',
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: Appcolors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  24.h,
                  Text(
                    textAlign: TextAlign.left,
                    'Theme',
                    style: theme.textTheme.bodyLarge,
                  ),
                  12.h,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1.5, color: Appcolors.primary),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: DropdownButton(
                        dropdownColor: Appcolors.light.withAlpha(200),
                        iconSize: 32,
                        icon: Icon(Iconsax.arrow_bottom_bold),
                        iconEnabledColor: Appcolors.primary,
                        underline: 0.h,
                        borderRadius: BorderRadius.circular(16),
                        isExpanded: true,
                        value: pro.islight ? 'L' : 'D',
                        onChanged: (value) {
                          value == 'L'
                              ? pro.changeTheme(ThemeMode.light)
                              : pro.changeTheme(ThemeMode.dark);
                        },
                        items: [
                          DropdownMenuItem(
                            value: 'L',
                            child: Text(
                              'Light',
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: Appcolors.primary,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "D",
                            child: Text(
                              'Dark',
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: Appcolors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomBtn(
              color: Appcolors.red,
              ontap: () => pro.Logout(context),
              text: 'Logout',
              isloading: pro.isloading,
            ),
          ),
          24.h,
        ],
      ),
    );
  }
}
