import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardStyles {
  static const Color bg = Color(0xFF0B141A);
  static const Color surface = Color(0xFF111B21);
  static const Color surfaceAlt = Color(0xFF1F2C34);
  static const Color accent = Color(0xFF00A884);
  static const Color accentMuted = Color(0xFF0B3F32);
  static const Color textPrimary = Color(0xFFE9EDEF);
  static const Color textSecondary = Color(0xFF8696A0);
  static const Color divider = Color(0xFF1C262D);

  static TextStyle font({
    Color? color,
    double size = 14,
    FontWeight weight = FontWeight.w500,
    double? letterSpacing,
  }) {
    return GoogleFonts.manrope(
      color: color,
      fontSize: size,
      fontWeight: weight,
      letterSpacing: letterSpacing,
    );
  }
}
