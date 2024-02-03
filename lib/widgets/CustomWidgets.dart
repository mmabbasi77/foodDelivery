import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWidgets {
  // --BoxShadow--
  BoxShadow commonBoxShadow = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 10,
      offset: const Offset(0, 3));

  // --ButtonStyle--
  ButtonStyle commonButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.red),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));
}
