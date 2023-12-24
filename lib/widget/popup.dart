import '../styles.dart';
import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:snipitz/widgets/button_widget.dart';
// import 'package:snipitz/widgets/menu_bottom_sheet_widget.dart';
// import 'package:snipitz/widgets/text_field_widget.dart';

class Popup {
  static void alertDialog(context,
      {required String message, required Function(String) dialogCallback}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message, style: Styles.dialogContentTextStyle),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.buttonDefaultBackgroundColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text("OK", style: TextStyle(color: Colors.white)),
              onPressed: () {
                // ignore: unnecessary_null_comparison
                if (dialogCallback != null) {
                  dialogCallback('OK');
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}