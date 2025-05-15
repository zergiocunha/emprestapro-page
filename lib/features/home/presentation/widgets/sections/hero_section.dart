import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html';

import '../../../../../core/constants/app_colors.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.mainBackground),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo com animação
          Container(
            width: 120, // ajuste conforme o tamanho do seu logo
            height: 120,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGreen.withOpacity(0.2),
                  blurRadius: 30,
                  spreadRadius: -5,
                ),
              ],
            ),
            child: Image.asset('assets/logo.png'),
          ).animate().fadeIn(duration: 800.ms).scale(
                begin: const Offset(0.8, 0.8),
                end: const Offset(1, 1),
                duration: 800.ms,
              ),
          const SizedBox(height: 24),
          // Nome do app com efeito de reveal
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                AppColors.primaryGreen,
                AppColors.primaryGreen.withOpacity(0.7),
              ],
            ).createShader(bounds),
            child: Text(
              'EmprestaPro',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ).animate().fadeIn().slideY(begin: -0.2),
          const SizedBox(height: 16),
          const Text(
            'Controle total dos seus empréstimos, de forma simples e profissional.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.secoundaryText, fontSize: 18),
          ).animate().fadeIn().slideY(begin: 0.2),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: AppColors.primaryText,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () async {
              final Uri url = Uri.parse('https://zergiocunha.com');
              try {
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch $url';
                }
              } catch (e) {
                // Fallback para caso o launcher não funcione
                window.open(url.toString(), '_blank');
              }
            },
            child: const Text('Quero conhecer agora!',
                style: TextStyle(fontSize: 18)),
          ).animate().fadeIn().slideY(begin: 0.4),
          const SizedBox(height: 48),
          const Wrap(
            spacing: 48,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              StatisticWidget(
                value: '10.000+',
                label: 'Usuários ativos',
              ),
              StatisticWidget(
                value: 'R\$ 50M+',
                label: 'Em empréstimos gerenciados',
              ),
              StatisticWidget(
                value: '4.8/5',
                label: 'Avaliação na Play Store',
              ),
            ],
          ).animate().fadeIn().slideY(begin: 0.3),
        ],
      ),
    );
  }
}

class StatisticWidget extends StatelessWidget {
  final String value;
  final String label;

  const StatisticWidget({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
