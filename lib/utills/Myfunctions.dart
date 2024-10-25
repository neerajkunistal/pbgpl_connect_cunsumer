import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constants.dart';
class GeneralFunctions {
  static bool isDialogShowing = false;

  static void showSessionExpireDialog(BuildContext context) {
    isDialogShowing = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Image(
              image: AssetImage('assets/icons/error.png'),
              width: 30,
              height: 30,
            ),
            contentTextStyle:TextStyle(fontSize: 16),
            content: Text(
                'Your earlier session has been expired. Please Login again to continue.'),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Login',
                  style: greyHeadingStyle.copyWith(color: primaryColor),
                ),
                onPressed: () async {
                  isDialogShowing = false;
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  String? deviceId = prefs.getString("device_id");
                  prefs.clear();
                  prefs.setString("device_id", deviceId!);
                  /*   Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => PhoneNumberPage()),
                      (Route<dynamic> route) => false);*/
                },
              ),
            ],
          );
        });
  }
}
showErrorMessage(String message,BuildContext context) async {

  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
    content: new Text(message),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  ));
}
showErrorDialog(BuildContext context, String message) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Image(
          image: AssetImage('assets/icons/error.png'),
          width: 30,
          height: 30,
        ),
        content: Text(message),
        contentTextStyle: TextStyle(fontSize: 14),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Ok',
              style: listItemTitleStyle.copyWith(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
showSuccessDialog(BuildContext context, String message) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Image(
          image: AssetImage('assets/icons/check-circle.png'),
          width: 30,
          height: 30,
        ),
        contentTextStyle: listItemTitleStyle,
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Ok',
              style: listItemTitleStyle.copyWith(color: Colors.green),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

