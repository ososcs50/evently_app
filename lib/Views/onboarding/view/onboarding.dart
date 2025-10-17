import 'package:evently_app/Views/onboarding/manger/onboard_pro.dart';
import 'package:evently_app/Views/onboarding/widget/page_body.dart';
import 'package:evently_app/Views/onboarding/widget/pageindicator.dart';
import 'package:evently_app/core/constant/extension/nav.dart';
import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/constant/logo_bar.dart';
import 'package:evently_app/core/route/approute.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class onboarding extends StatelessWidget {
  const onboarding({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    List<PageBody> pages = [
      PageBody(
        theme: theme,
        img: 'assets/images/onboarding_2.png',
        title: 'Find Events That Inspire You',
        sub:
            'Dive into a world of events crafted to fit your unique interests. Whether you'
            're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
      ),
      PageBody(
        theme: theme,
        img: 'assets/images/onboarding_3.png',
        title: 'Effortless Event Planning',
        sub:
            'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
      ),
      PageBody(
        theme: theme,
        img: 'assets/images/onboarding_4.png',
        title: 'Connect with Friends & Share Moments',
        sub:
            'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
      ),
    ];
    return ChangeNotifierProvider(
      create: (BuildContext context) => OnboardPro(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Consumer<OnboardPro>(
                builder:
                    (
                      BuildContext context,
                      OnboardPro pro,
                      Widget? child,
                    ) => Column(
                      children: [
                        Logo_Bar(),
                        40.h,
                        Expanded(
                          child: PageView.builder(
                            onPageChanged: (value) => pro.change(value),
                            controller: pro.controller,
                            itemCount: pages.length,
                            itemBuilder: (context, i) {
                              return pages[i];
                            },
                          ),
                        ),
                        20.h,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            pro.current == 0
                                ? 48.w
                                : IconButton(
                                    style: ButtonStyle(
                                      side: WidgetStatePropertyAll(
                                        BorderSide(color: Appcolors.primary),
                                      ),
                                    ),
                                    onPressed: () {
                                      pro.Back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: Appcolors.primary,
                                    ),
                                  ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < pages.length; i++)
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: PageIndicator(
                                      isActive: i == pro.current,
                                    ),
                                  ),
                              ],
                            ),
                            pro.current == pages.length - 1
                                ? TextButton(
                                    onPressed: () =>
                                        context.goAndRemove(ApprouteName.login),
                                    child: Text(
                                      'Get Started',
                                      style: theme.textTheme.displayMedium,
                                    ),
                                  )
                                : IconButton(
                                    style: ButtonStyle(
                                      side: WidgetStatePropertyAll(
                                        BorderSide(color: Appcolors.primary),
                                      ),
                                    ),
                                    onPressed: () {
                                      pro.next();
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Appcolors.primary,
                                    ),
                                  ),
                          ],
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
