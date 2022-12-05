import 'package:flutter/material.dart';

class UtilMethods {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  static Future<void> warningDialogPopUp(
      {required String title,
      required String subText,
      required Function functionHandle,
      required BuildContext context}) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(subText),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) Navigator.pop(context);
              },
              child: const Text('No',
                  style: TextStyle(
                    color: Colors.green,
                  )),
            ),
            TextButton(
              onPressed: () {
                functionHandle();
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
          elevation: 48,
        );
      },
    );
  }
}
