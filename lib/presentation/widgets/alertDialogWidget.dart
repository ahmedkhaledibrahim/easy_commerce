import 'package:flutter/material.dart';

Future alertDialogWidget(
    {required String title,
    required String content,
    required BuildContext context}) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
      content: Text(
        content,
        style: const TextStyle(
            fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black),
      ),
      actions: [
        TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
