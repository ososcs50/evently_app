import 'package:evently_app/Views/layout/views/event_ui/service/event_service.dart';
import 'package:evently_app/core/constant/extension/nav.dart';
import 'package:evently_app/core/models/Category_model.dart';
import 'package:evently_app/core/models/event_model.dart';
import 'package:evently_app/core/route/approute.dart';
import 'package:evently_app/core/widgets/appdialog.dart';
import 'package:evently_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Eventpro with ChangeNotifier {
  String get uid => FirebaseAuth.instance.currentUser!.uid;

  bool isloading = false;
  int _tabindex = 0;
  int get tabindex => _tabindex;
  DateTime? eventdate;
  TimeOfDay? eventtime;
  TextEditingController TitleController = TextEditingController();
  TextEditingController DescController = TextEditingController();
  CategoryModel get selectedCategory => CategoryModel.categories[tabindex];
  final formKey = GlobalKey<FormState>();

  void ontabchange(int index) {
    _tabindex = index;
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

  Future<void> delete_Event(String id) async {
    try {
      await EventService.deleteEvent(id);

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future<void> edit_event(EventModel event) async {
    EventModel Newevent = EventModel(
      userid: event.userid,
      id: event.id,
      title: TitleController.text,
      desc: DescController.text,
      date: DateFormat('y-MM-dd').format(eventdate ?? DateTime.now()),
      time:
          eventtime?.format(navkey.currentContext!) ??
          TimeOfDay.now().format(navkey.currentContext!),
      imageUrl: selectedCategory.imageUrl,
      CategoryId: selectedCategory.id,
    );
    isloading = true;
    notifyListeners();
    try {
      await EventService.updateEvent(Newevent);
      isloading = false;
      Appdialog.ShowMessage(
        navkey.currentContext!,
        title: "Event Edit Successfully",
      );
      navkey.currentContext!.goReplacement(ApprouteName.layout);
    } catch (e) {
      isloading = false;
      notifyListeners();
      Appdialog.ShowMessage(
        navkey.currentContext!,
        title: "Event Edit Field",
        type: MessageType.error,
      );
    }
  }

  void setevent(EventModel event) {
    TitleController.text = event.title;
    DescController.text = event.desc;
    eventdate = DateTime.parse(event.date);

    String timeString = event.time;
    DateFormat format = DateFormat("hh:mm a");
    DateTime dateTime = format.parse(timeString);

    eventtime = TimeOfDay.fromDateTime(dateTime);
    int getindex = CategoryModel.categories.indexWhere(
      (element) => element.id == event.CategoryId,
    );
    ontabchange(getindex);
    notifyListeners();
  }
}
