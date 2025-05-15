import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/app_colors.dart';

class CallToActionSection extends StatefulWidget {
  const CallToActionSection({super.key});

  @override
  State<CallToActionSection> createState() => _CallToActionSectionState();
}

class _CallToActionSectionState extends State<CallToActionSection> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Obter o tamanho da tela
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.accentGlow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primaryGreen.withOpacity(0.3)),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24, // Margem menor em dispositivos móveis
        vertical: isMobile ? 16 : 0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 16 : 24,
      ),
      child: Stack(
        children: [
          // Efeito de fundo animado
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryGreen.withOpacity(0.1),
                    Colors.transparent,
                  ],
                  center: Alignment.center,
                  radius: 1.0,
                ),
              ),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .scale(
                  duration: 3.seconds,
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1.2, 1.2),
                ),
          ),

          // Conteúdo
          Column(
            children: [
              Text(
                '🚀 Pronto para Revolucionar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  color: AppColors.primaryGreen,
                  fontWeight: FontWeight.w600,
                ),
              ).animate().fadeIn().slideY(begin: -0.2),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'Transforme Seu Controle\nFinanceiro Hoje',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ).animate().fadeIn().scale(),
              SizedBox(height: isMobile ? 16 : 24),
              Text(
                'Junte-se a milhares de empresas que já estão otimizando suas finanças',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 18,
                  color: AppColors.secoundaryText,
                ),
              ).animate().fadeIn().slideY(begin: 0.2),
              SizedBox(height: isMobile ? 32 : 40),
              MouseRegion(
                onEnter: (_) => setState(() => isHovered = true),
                onExit: (_) => setState(() => isHovered = false),
                child: AnimatedContainer(
                  duration: 200.ms,
                  transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 24 : 40,
                        vertical: isMobile ? 16 : 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: isHovered ? 8 : 4,
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Começar Gratuitamente',
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          size: isMobile ? 16 : 20,
                        )
                            .animate(
                              target: isHovered ? 1 : 0,
                            )
                            .slideX(
                              begin: 0,
                              end: 0.5,
                            ),
                      ],
                    ),
                  ),
                ),
              ).animate().fadeIn().slideY(begin: 0.2),
              SizedBox(height: isMobile ? 20 : 24),
              if (isMobile)
                Column(
                  children: [
                    _buildFeatureIcon(Icons.lock, 'Teste Grátis'),
                    SizedBox(height: 12),
                    _buildFeatureIcon(Icons.credit_card, 'Sem Cartão'),
                    SizedBox(height: 12),
                    _buildFeatureIcon(Icons.touch_app, 'Cancele Quando Quiser'),
                  ],
                ).animate().fadeIn().slideY(begin: 0.2)
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildFeatureIcon(Icons.lock, 'Teste Grátis'),
                    _buildDivider(),
                    _buildFeatureIcon(Icons.credit_card, 'Sem Cartão'),
                    _buildDivider(),
                    _buildFeatureIcon(Icons.touch_app, 'Cancele Quando Quiser'),
                  ],
                ).animate().fadeIn().slideY(begin: 0.2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String text) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: isMobile ? 14 : 16,
          color: AppColors.primaryGreen,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            color: AppColors.secoundaryText,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '•',
        style: TextStyle(
          color: AppColors.secoundaryText.withOpacity(0.5),
        ),
      ),
    );
  }
}
