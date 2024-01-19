import 'package:flutter/material.dart';

class ButtonStyles {
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.blue,
    backgroundColor: Colors.white,
    side: const BorderSide(color: Colors.blue, width: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
