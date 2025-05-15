import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/scroll_animated_widget.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.mainBackground),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          const ScrollAnimatedWidget(
            child: Text(
              'Planos que cabem no seu bolso',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 24,
            children: [
              ScrollAnimatedWidget(
                delay: 200.ms,
                slideOffset: 0.4,
                child: const PricingCard(
                  title: 'Básico',
                  price: 'R\$ 29,90/mês',
                  features: [
                    'Até 50 clientes',
                    'Lembretes automáticos',
                    'Relatórios básicos',
                  ],
                  isPopular: false,
                ),
              ),
              ScrollAnimatedWidget(
                delay: 400.ms,
                slideOffset: 0.4,
                child: const PricingCard(
                  title: 'Profissional',
                  price: 'R\$ 59,90/mês',
                  features: [
                    'Clientes ilimitados',
                    'Lembretes personalizados',
                    'Relatórios avançados',
                    'Backup em nuvem',
                  ],
                  isPopular: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PricingCard extends StatefulWidget {
  final String title;
  final String price;
  final List<String> features;
  final bool isPopular;

  const PricingCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
    required this.isPopular,
  });

  @override
  State<PricingCard> createState() => PricingCardState();
}

class PricingCardState extends State<PricingCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHovered
            ? (Matrix4.identity()..translate(0, -10, 0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          gradient: widget.isPopular
              ? LinearGradient(
                  colors: [
                    AppColors.primaryGreen.withOpacity(0.15),
                    AppColors.primaryGreen.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: widget.isPopular
              ? null
              : Colors.white.withOpacity(isHovered ? 0.08 : 0.03),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isPopular
                ? AppColors.primaryGreen
                : AppColors.primaryGreen.withOpacity(0.2),
            width: widget.isPopular ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryGreen
                  .withOpacity(widget.isPopular ? 0.2 : 0.05),
              blurRadius: isHovered ? 30 : 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        width: 280,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            if (widget.isPopular)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryText,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Mais Popular',
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(height: 12),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.price,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: widget.isPopular
                    ? AppColors.primaryText
                    : AppColors.primaryGreen,
              ),
            ),
            const SizedBox(height: 16),
            ...widget.features.map((feature) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.primaryGreen,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        feature,
                        style: TextStyle(
                          color: widget.isPopular
                              ? AppColors.primaryText
                              : AppColors.secoundaryText,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
