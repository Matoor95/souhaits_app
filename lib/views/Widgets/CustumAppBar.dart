import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  String titleString;
  String ButtonTitle;
  VoidCallback callback;
  CustomAppBar(
      {required this.titleString,
      required this.ButtonTitle,
      required this.callback})
      : super(actions: [
          TextButton(
              onPressed: callback,
              child: Text(
                ButtonTitle,
                style: const TextStyle(color: Colors.white),
              ))
        ]);
}
