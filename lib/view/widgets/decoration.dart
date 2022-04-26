import 'package:flutter/material.dart';

class MyDecoration {
  static InputDecoration inputDecoration(
      {required String label, required String hint, required IconData icon}) {
    return InputDecoration(
      label: Text(label),
      hintText: hint,
      fillColor: Colors.grey,
      focusColor: Colors.grey,
      //
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(),
      ),
      prefixIcon: Icon(icon, size: 22),
    );
  }

  static var userTileBoxDecoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          blurStyle: BlurStyle.normal,
          color: Colors.blueGrey.withOpacity(0.2),
          offset: const Offset(2, 4),
          spreadRadius: 2,
        ),
        const BoxShadow(
          blurRadius: 0,
          blurStyle: BlurStyle.normal,
          color: Colors.white,
          offset: Offset(0, 0),
          spreadRadius: 0,
        ),
      ],
    );
}