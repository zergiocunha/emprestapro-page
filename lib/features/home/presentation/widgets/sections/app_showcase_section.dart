import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/app_colors.dart';

class AppShowcaseSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.mainBackground),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          const Text(
            'Conheça o app por dentro',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ).animate().fadeIn(),
          const SizedBox(height: 40),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const AppScreenshot(
                  image: 'assets/screen1.png',
                  title: 'Dashboard intuitivo',
                ),
                // _AppScreenshot(
                //   image: 'screen2.png',
                //   title: 'Gestão de clientes',
                // ),
                // _AppScreenshot(
                //   image: 'assets/screen3.png',
                //   title: 'Relatórios detalhados',
                // ),
              ].animate(interval: 200.ms).fadeIn().slideX(),
            ),
          ),
        ],
      ),
    );
  }
}

class AppScreenshot extends StatelessWidget {
  final String image;
  final String title;

  const AppScreenshot({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, width: 200),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
