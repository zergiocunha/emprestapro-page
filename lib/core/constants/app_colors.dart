// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF1A1F24);
  static const Color secoundaryBackground = Color(0xFF000000);
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secoundaryText = Color(0xFF8B97A2);
  static const Color thirdText = Color(0xFFB4FFFFF);
  static const Color primaryGreen = Color(0xFF39D2C0);
  static const Color primaryRed = Color.fromARGB(255, 255, 0, 51);
  static const Color secoundaryRed = Color(0xFFF2A384);
  static const Color secundaryGreen = Color(0xFF00968A);
  static const Color secondaryRed = Color(0x4DD23939);

  static const LinearGradient mainBackground = LinearGradient(
    colors: [
      Color(0xFF1A1F24),
      Color(0xFF1E2429),
      Color(0xFF1E2A2A),
      Color(0xFF1E2429),
      Color(0xFF1A1F24),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.25, 0.5, 0.75, 1.0],
    transform: GradientRotation(45 * 3.141592 / 180), // 45 graus em radianos
  );

  static const LinearGradient accentGlow = LinearGradient(
    colors: [
      Colors.transparent,
      Color(0x0839D2C0),
      Colors.transparent,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient heroBackground = LinearGradient(
    colors: [
      Color(0xFF1A1F24),
      Color(0xFF1E2429),
      Color(0xFF1E2A2A),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const List<Color> particleColors = [
    Color(0xFF39D2C0),
    Color(0xFF00968A),
    Color(0xFF1E2A2A),
  ];

  // Efeitos de Glass
  static BoxDecoration glassEffect = BoxDecoration(
    color: Colors.white.withOpacity(0.05),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: primaryGreen.withOpacity(0.1)),
    boxShadow: [
      BoxShadow(
        color: primaryGreen.withOpacity(0.05),
        blurRadius: 20,
        spreadRadius: -5,
      ),
    ],
  );

  // Efeitos de Hover
  static BoxDecoration glassEffectHover = BoxDecoration(
    color: Colors.white.withOpacity(0.08),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: primaryGreen.withOpacity(0.2)),
    boxShadow: [
      BoxShadow(
        color: primaryGreen.withOpacity(0.1),
        blurRadius: 30,
        spreadRadius: -2,
      ),
    ],
  );

  // Estilo para botões principais
  static ButtonStyle primaryButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return primaryGreen.withOpacity(0.9);
      }
      return primaryGreen;
    }),
    foregroundColor: WidgetStateProperty.all(primaryText),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevation: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) return 8;
      return 4;
    }),
    shadowColor: WidgetStateProperty.all(primaryGreen.withOpacity(0.5)),
  );
}
