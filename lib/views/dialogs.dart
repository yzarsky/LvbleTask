import 'package:flutter/material.dart';

void showResultDialog(context, String msg) {
  showGeneralDialog(
    context: context,
    barrierLabel: 'Label',
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Dialog(
        child: Container(
          margin: const EdgeInsets.all(20),
          height: 200,
          width: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  msg,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2C2C63)),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff2C2C63)))))
              ],
            ),
          ),
        ),
      );
    },
  );
}
