import 'package:flutter/material.dart';
class ShowAlertDialog{
  ShowAlertDialog.internal();
  static ShowAlertDialog _showAlertDialogInstance = ShowAlertDialog.internal();

  factory ShowAlertDialog ()=> _showAlertDialogInstance;
 static Future<void> showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog( // <-- SEE HERE
          title: const Text('Cancel booking'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want to cancel booking?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
