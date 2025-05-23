import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Priority brand/display colors
  static const Color primary = Color(0xFFA9B5DF); // #A9B5DF (main)
  static const Color secondary = Color(0xFF7886C7); // #7886C7 (accent)
  static const Color dark = Color(0xFF2D336B); // #2D336B (deep)

  // Light background
  static const Color background = Color(0xFFFFF2F2); // #FFF2F2

  // Additional tints/shades based on the above
  static const Color primaryLight = Color(
    0xFFD6DBF0,
  ); // lighter version of primary
  static const Color primaryDark = Color(
    0xFF7A86B6,
  ); // darker version of primary

  static const Color secondaryLight = Color(
    0xFFAEB8E0,
  ); // lighter version of secondary
  static const Color secondaryDark = Color(
    0xFF5A649E,
  ); // darker version of secondary

  static const Color darkLight = Color(0xFF49508A); // lighter version of dark
  static const Color darkDarker = Color(0xFF1A1E3A); // even darker

  // Neutral/utility colors
  static const Color border = Color(0xFFE0E3ED); // subtle border
  static const Color surface = Color(0xFFF7F8FC); // card/surface
  static const Color error = Color(0xFFD32F2F); // error red
  static const Color success = Color(0xFF388E3C); // success green

  static const Color paid = Color(0xFF4CAF50); // Paid
  static const Color pending = Color(0xFFFFC107); // Pending
  static const Color cancelled = Color(0xFFF44336); // Cancelled
  static const Color completed = Color(0xFF1976D2); // Completed
  static const Color processing = Color(0xFF2196F3); // Processing
  static const Color refunded = Color(0xFF9C27B0);
}
