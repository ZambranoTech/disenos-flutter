// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppTheme {
  final Color colorScheme;
  final bool isDarkMode;
  final bool isCustomTheme;

  AppTheme({
    this.colorScheme = Colors.purple, 
    this.isDarkMode = true,
    this.isCustomTheme = false,
  });

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: 
      isCustomTheme 
      ? Colors.green 
      : isDarkMode ?  colorScheme : Colors.blue
  );

  AppTheme copyWith({
    Color? colorScheme,
    bool? isDarkMode,
    bool? isCustomTheme,
  }) {
    return AppTheme(
      colorScheme: colorScheme ?? this.colorScheme,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isCustomTheme: isCustomTheme ?? this.isCustomTheme,
    );
  }
}
