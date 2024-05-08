import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toaster {
  static void showToast(String input) {
    Fluttertoast.showToast(
      msg: input,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      textColor: Colors.white,
      backgroundColor: Colors.green,
      fontSize: 16.0,
    );
  }
}
