import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/models/Category_model.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tabs_Row extends StatelessWidget {
  Function(int) onTap;
  int tabindex;
  final List<CategoryModel> categorys;
  final Color primery;
  final Color secondry;
  Tabs_Row({
    required this.onTap,
    required this.tabindex,
    super.key,
    required this.categorys,
    this.primery = Appcolors.primary,
    this.secondry = Appcolors.light,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categorys.length,
      child: TabBar(
        onTap: (value) => onTap(value),
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelColor: primery,
        labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        labelPadding: const EdgeInsets.symmetric(horizontal: 6),
        unselectedLabelColor: secondry,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        tabs: categorys.map((e) {
          int index = categorys.indexOf(e);
          return Tab(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: index == tabindex ? secondry : Colors.transparent,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: secondry, width: 1.5),
              ),
              child: Row(
                children: [ImageIcon(AssetImage(e.icon)), 6.w, Text(e.name)],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
