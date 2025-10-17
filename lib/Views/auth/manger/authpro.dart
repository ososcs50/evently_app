import 'package:evently_app/core/Services/authservices.dart';
import 'package:evently_app/core/widgets/appdialog.dart';
import 'package:evently_app/core/constant/extension/nav.dart';
import 'package:evently_app/core/route/approute.dart';

import 'package:flutter/material.dart';

class Authpro with ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;
  bool _showpass = false;
  bool get showpass => _showpass;
  TextEditingController emailcontrollor = TextEditingController();
  TextEditingController passcontrollor = TextEditingController();
  TextEditingController Cemailcontrollor = TextEditingController();
  TextEditingController Cpasscontrollor = TextEditingController();
  TextEditingController Repasscontrollor = TextEditingController();
  TextEditingController namecontrollor = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final CformKey = GlobalKey<FormState>();

  namevalidtor(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  emailvalidtor(String? val) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (val == null || val.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(val)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  passvalidtor(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please Enter Password';
    } else if (val.length < 6) {
      return 'Enter more then 6 ';
    }
    return null;
  }

  Repassvalidtor(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please Enter Password';
    } else if (val != Cpasscontrollor.text.trim()) {
      return 'PassWord Not Match';
    }
    return null;
  }

  changeShow() {
    _showpass = !_showpass;
    notifyListeners();
  }

  void CreateAcc(BuildContext context) async {
    if (CformKey.currentState!.validate()) {
      _isloading = true;
      notifyListeners();
      try {
        var user = await Authservices.createacc(
          Cemailcontrollor.text.trim(),
          Cpasscontrollor.text,
          namecontrollor.text,
        );
        await user.user!.sendEmailVerification();
        Appdialog.ShowMessage(
          context,
          title: "Create Account Is Sccess,Go Check inbox ",
        );
        Navigator.pushReplacementNamed(context, ApprouteName.login);
      } catch (e) {
        Appdialog.ShowMessage(
          context,
          title: e.toString(),
          type: MessageType.error,
        );
      }
      _isloading = false;
      notifyListeners();
    }
  }

  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      _isloading = true;
      notifyListeners();
      try {
        var user = await Authservices.loginWithEmail(
          emailcontrollor.text.trim(),
          passcontrollor.text,
        );
        if (user.user!.emailVerified) {
          Appdialog.ShowMessage(
            context,
            title: "Welcome : ${user.user!.displayName}",
          );
          context.goAndRemove(ApprouteName.layout);
        } else {
          Appdialog.ShowMessage(
            context,
            title: "Email Not Verified, Plese Check inbox",
            type: MessageType.error,
          );
        }
      } catch (e) {
        Appdialog.ShowMessage(
          context,
          title: "Email Or Password Is Not Correct",
          type: MessageType.error,
        );
      }
      _isloading = false;
      notifyListeners();
    }
  }

  void googlelogin(BuildContext context) async {
    _isloading = true;
    notifyListeners();
    try {
      var user = await Authservices.signInWithGoogle();

      Appdialog.ShowMessage(
        context,
        title: "Welcome : ${user!.user!.displayName}",
      );
      context.goAndRemove(ApprouteName.layout);
    } catch (e) {
      Appdialog.ShowMessage(
        context,
        title: "SomeThing Went Wrong",
        type: MessageType.error,
      );
    }
    _isloading = false;
    notifyListeners();
  }
}
