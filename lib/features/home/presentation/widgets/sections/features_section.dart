import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/scroll_animated_widget.dart';
import '../../../data/repositories/mock_data.dart';

class FeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      width: double.infinity, // Garante que o container ocupe toda a largura
      child: Stack(
        alignment: Alignment.center, // Centraliza o conteúdo do Stack
        children: [
          // Efeito de brilho sutil
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.accentGlow,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          // Conteúdo
          Center(
            // Adiciona um widget Center
            child: ConstrainedBox(
              // Adiciona uma restrição máxima de largura
              constraints: const BoxConstraints(
                  maxWidth: 1200), // Ajuste este valor conforme necessário
              child: Column(
                children: [
                  const ScrollAnimatedWidget(
                    child: Text(
                      'Por que escolher o EmprestaPro?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                      ),
                      textAlign: TextAlign
                          .center, // Garante que o texto fique centralizado
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    // Adiciona outro Center para o Wrap
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 24,
                      runSpacing: 24,
                      children: [
                        for (var i = 0; i < features.length; i++)
                          ScrollAnimatedWidget(
                            delay: (i * 200).ms,
                            child: FeatureCard(
                              icon: features[i].icon,
                              title: features[i].title,
                              description: features[i].description,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 300,
        padding: const EdgeInsets.all(24),
        decoration:
            isHovered ? AppColors.glassEffectHover : AppColors.glassEffect,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: isHovered
                  ? (Matrix4.identity()..scale(1.1))
                  : Matrix4.identity(),
              child: Icon(
                widget.icon,
                size: 48,
                color: AppColors.primaryGreen,
              ),
            ),
            const SizedBox(height: 16),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: isHovered ? 22 : 20,
                fontWeight: FontWeight.bold,
              ),
              child: Text(widget.title),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: const TextStyle(
                color: AppColors.secoundaryText,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
