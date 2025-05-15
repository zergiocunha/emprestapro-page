import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.mainBackground),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Image.asset(
            'assets/logo.png',
            height: 60,
          ),
          const SizedBox(height: 16),
          const Text(
            'EmprestaPro © 2025. Todos os direitos reservados.',
            style: TextStyle(color: AppColors.secoundaryText),
          ),
        ],
      ),
    );
  }
}
