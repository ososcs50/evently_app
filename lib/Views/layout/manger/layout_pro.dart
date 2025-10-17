import 'package:evently_app/Views/layout/service/layout_service.dart';
import 'package:evently_app/Views/layout/views/favorite/layout_fav.dart';
import 'package:evently_app/Views/layout/views/home/layout_home.dart';
import 'package:evently_app/Views/layout/views/map/layout_map.dart';
import 'package:evently_app/Views/layout/views/profile/layout_profile.dart';
import 'package:evently_app/core/models/Category_model.dart';
import 'package:evently_app/core/models/event_model.dart';
import 'package:flutter/material.dart';

class LayoutPro with ChangeNotifier {
  int current = 0;
  List<Widget> pages = [
    Layouthome(),
    LayoutMap(),
    LayoutFav(),
    LayoutProfile(),
  ];
  int tabindex = 0;
  CategoryModel get selectedCategory =>
      CategoryModel.categoriesWithAll[tabindex];
  ontabchange(int val) {
    tabindex = val;
    notifyListeners();
  }

  Future<void> changeFav(EventModel event) async {
    await LayoutServices.updateEventFav(event);
    // notifyListeners();
  }

  List<EventModel> favlist = [];
  void getfavlist() {
    var fav = LayoutServices.getFavStream();
    fav.listen((event) {
      favlist.clear();
      for (var e in event.docs) {
        favlist.add(e.data());
      }
      notifyListeners();
    });
  }

  Widget get screnn => pages[current];
  void changepage(int val) {
    current = val;
    notifyListeners();
  }
}
