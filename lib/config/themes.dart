import 'package:flutter/material.dart';

ThemeData get appTheme {
  return ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: Color.fromRGBO(72, 74, 126, 1),
    ),
  );
}
