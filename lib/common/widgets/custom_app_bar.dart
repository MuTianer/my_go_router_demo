import 'package:flutter/material.dart';

AppBar customAppBar({
  required String title,
  required VoidCallback backOnPressed,
  required VoidCallback closeOnPressed,
}) {
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.amber,
    leading: IconButton(
      onPressed: backOnPressed,
      icon: const Icon(
        Icons.arrow_back_ios_new,
        size: 24,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          closeOnPressed();
        },
        icon: const Icon(
          Icons.close,
          size: 24,
        ),
      )
    ],
  );
}
