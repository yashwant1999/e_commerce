import 'package:flutter/material.dart';

class Util {
  // static void showSheet(
  //   BuildContext context, {
  //   required Widget child,
  //   required VoidCallback onClicked,
  // }) =>
  //     showCupertinoModalPopup(
  //       context: context,
  //       builder: (context) => CupertinoActionSheet(
  //         actions: [
  //           child,
  //         ],
  //         cancelButton: CupertinoActionSheetAction(
  //           onPressed: onClicked,
  //           child: const Text('Done'),
  //         ),
  //       ),
  //     );

  static void showSnack(
    BuildContext context, {
    required String content,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(content),
        ),
      );
}
