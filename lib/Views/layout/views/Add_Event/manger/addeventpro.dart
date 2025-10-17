import 'package:evently_app/Views/layout/views/Add_Event/service/event_service.dart';
import 'package:evently_app/core/models/Category_model.dart';
import 'package:evently_app/core/models/event_model.dart';
import 'package:evently_app/core/widgets/appdialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Addeventpro with ChangeNotifier {
  String get uid => FirebaseAuth.instance.currentUser!.uid;

  bool isloading = false;
  int tabindex = 0;
  DateTime? eventdate;
  TimeOfDay? eventtime;
  TextEditingController TitleController = TextEditingController();
  TextEditingController DescController = TextEditingController();
  CategoryModel get selectedCategory => CategoryModel.categories[tabindex];
  final formKey = GlobalKey<FormState>();

  void ontabchange(int index) {
    tabindex = index;
    notifyListeners();
  }

  void changedate(DateTime? date) {
    eventdate = date;
    notifyListeners();
  }

  void changetime(TimeOfDay? date) {
    eventtime = date;
    notifyListeners();
  }

  Future<bool> addevent(BuildContext context) async {
    EventModel event = EventModel(
      userid: uid,
      id: selectedCategory.id,
      title: TitleController.text,
      desc: DescController.text,
      date: DateFormat('y-MM-dd').format(eventdate ?? DateTime.now()),
      time: eventtime?.format(context) ?? TimeOfDay.now().format(context),
      imageUrl: selectedCategory.imageUrl,
      CategoryId: selectedCategory.id,
    );
    if (formKey.currentState!.validate() &&
        eventdate != null &&
        eventtime != null) {
      isloading = true;
      notifyListeners();
      try {
        await EventService.SetEvent(event);
        isloading = false;
        notifyListeners();
        Appdialog.ShowMessage(context, title: "Event Add Successfully");

        return true;
      } catch (e) {
        isloading = false;
        notifyListeners();
        Appdialog.ShowMessage(
          context,
          title: "Event Add Field",
          type: MessageType.error,
        );
        return false;
      }
    } else {
      return false;
    }
  }
}
