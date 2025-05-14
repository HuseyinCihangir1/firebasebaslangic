import 'package:flutter/material.dart';

void gosterSnackBar(BuildContext context, String mesaj) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mesaj),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
    ),
  );
}
