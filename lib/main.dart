import 'package:flutter/material.dart';

import 'core/constants/app_colors.dart';
import 'features/home/presentation/pages/landing_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: AppColors.primaryGreen,
        secondary: AppColors.secundaryGreen,
      ),
    ),
    home: const EmprestaProLandingPage(),
  ));
}
