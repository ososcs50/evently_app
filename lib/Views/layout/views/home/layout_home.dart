import 'package:animate_do/animate_do.dart';
import 'package:evently_app/Views/layout/manger/layout_pro.dart';
import 'package:evently_app/Views/layout/service/layout_service.dart';
import 'package:evently_app/Views/layout/widgets/event_card.dart';
import 'package:evently_app/Views/layout/widgets/tabs_row.dart';
import 'package:evently_app/core/constant/extension/duration.dart';
import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/manger/app_provider.dart';
import 'package:evently_app/core/models/Category_model.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class Layouthome extends StatelessWidget {
  const Layouthome({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var pro = Provider.of<AppProvider>(context);
    var user = FirebaseAuth.instance.currentUser;

    return Consumer<LayoutPro>(
      builder: (BuildContext context, LayoutPro Layoutpro, Widget? child) =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: pro.tm == ThemeMode.light
                      ? Appcolors.primary
                      : Appcolors.dark,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    24.h,
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome Back ✨',
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: Appcolors.light,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              (user?.displayName ?? '').toUpperCase(),
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: Appcolors.light,
                                // fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              pro.islight
                                  ? 'assets/icons/Sun.svg'
                                  : 'assets/icons/Moon.svg',
                              height: 38,
                              colorFilter: ColorFilter.mode(
                                Appcolors.light,
                                BlendMode.srcIn,
                              ),
                            ),
                            8.w,
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Appcolors.light,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                pro.English ? 'EN' : 'AR',
                                style: theme.textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Iconsax.location_outline, color: Appcolors.light),
                        4.w,
                        Text(
                          'Cairo , Egypt',
                          style: TextStyle(color: Appcolors.light),
                        ),
                      ],
                    ),
                    24.h,
                    Tabs_Row(
                      onTap: (p1) => Layoutpro.ontabchange(p1),
                      tabindex: Layoutpro.tabindex,
                      categorys: CategoryModel.categoriesWithAll,
                    ),
                  ],
                ),
              ),

              StreamBuilder(
                stream: LayoutServices.getEventStream(
                  Layoutpro.selectedCategory.id,
                ),
                builder: (context, event) {
                  if (event.hasError) {
                    return Center(child: Text('Opps,${event.error}'));
                  } else if (event.hasData) {
                    var data = event.data!.docs;

                    return Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          var eventdata = data[index].data();

                          return index % 2 == 0
                              ? FadeInLeft(
                                  duration: 350.mill,
                                  child: Event_Card(
                                    islight: pro.islight,

                                    eventdata: eventdata,
                                  ),
                                )
                              : FadeInRight(
                                  duration: 350.mill,
                                  child: Event_Card(
                                    islight: pro.islight,

                                    eventdata: eventdata,
                                  ),
                                );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Appcolors.primary,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
    );
  }
}
