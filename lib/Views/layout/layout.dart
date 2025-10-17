import 'package:evently_app/Views/layout/manger/layout_pro.dart';
import 'package:evently_app/core/constant/extension/nav.dart';
import 'package:evently_app/core/route/approute.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LayoutPro()..getfavlist(),

      child: Consumer<LayoutPro>(
        builder: (BuildContext context, pro, Widget? child) => Scaffold(
          body: pro.screnn,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            onPressed: () => context.go(ApprouteName.addevent),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Appcolors.light, width: 3),
              borderRadius: BorderRadiusGeometry.circular(360),
            ),
            child: Icon(Icons.add, color: Appcolors.light, size: 35),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: pro.current,
            onTap: (value) => pro.changepage(value),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home_2_outline),
                activeIcon: Icon(Iconsax.home_2_bold),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.location_outline),
                activeIcon: Icon(Iconsax.location_bold),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.heart_outline),
                activeIcon: Icon(Iconsax.heart_bold),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
