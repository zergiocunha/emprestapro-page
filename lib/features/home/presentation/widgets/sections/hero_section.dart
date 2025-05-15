import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html';

import '../../../../../core/constants/app_colors.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  bool isButtonHovered = false;
  late final AnimationController _particleController;
  late final AnimationController _floatingController;
  final Random _random = math.Random();

  @override
  void initState() {
    super.initState();
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _particleController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.mainBackground,
        backgroundBlendMode: BlendMode.multiply,
      ),
      child: Stack(
        children: [
          _buildBackgroundMist(),
          _buildSectionOutline(), // Novo efeito
          ..._buildBackgroundParticles(),
          _buildRadialGlow(),

          // Conteúdo principal centralizado
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 120), // Aumentado o padding
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo com efeito de brilho
                    Container(
                      width: 180, // Aumentado de 120 para 180
                      height: 180, // Aumentado de 120 para 180
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppColors.background.withOpacity(0.8),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryGreen.withOpacity(0.2),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Image.asset('assets/logo.png'),
                    ).animate().fadeIn(duration: 800.ms).scale(),

                    const SizedBox(height: 60), // Aumentado de 40 para 60

                    // Título com efeito gradiente animado
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          AppColors.primaryGreen,
                          Colors.white,
                          AppColors.primaryGreen.withOpacity(0.7),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ).createShader(bounds),
                      child: Text(
                        'EmprestaPro',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                      ),
                    ).animate().fadeIn().slideY(begin: -0.2),

                    const SizedBox(height: 32), // Aumentado de 24 para 32

                    // Subtítulo com efeito typing
                    SizedBox(
                      width: 600,
                      child: Text(
                        'Controle total dos seus empréstimos,\nde forma simples e profissional.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.secoundaryText,
                          fontSize: 24,
                          height: 1.4,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ).animate().fadeIn().slideY(begin: 0.2),

                    const SizedBox(height: 64), // Aumentado de 48 para 64

                    // Botão com efeito hover
                    MouseRegion(
                      onEnter: (_) => setState(() => isButtonHovered = true),
                      onExit: (_) => setState(() => isButtonHovered = false),
                      child: AnimatedContainer(
                        duration: 200.ms,
                        transform: Matrix4.identity()
                          ..scale(isButtonHovered ? 1.05 : 1.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryGreen,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 24,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: isButtonHovered ? 8 : 4,
                          ),
                          onPressed: () async {
                            final Uri url =
                                Uri.parse('https://zergiocunha.com');
                            try {
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                throw 'Could not launch $url';
                              }
                            } catch (e) {
                              window.open(url.toString(), '_blank');
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Quero conhecer agora!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward,
                                size: 20,
                              )
                                  .animate(
                                    target: isButtonHovered ? 1 : 0,
                                  )
                                  .slideX(
                                    begin: 0,
                                    end: 0.5,
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ).animate().fadeIn().slideY(begin: 0.4),

                    const SizedBox(height: 64),

                    // Estatísticas com cards de vidro
                    Wrap(
                      spacing: 48,
                      runSpacing: 24,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildStatisticCard(
                          '10.000+',
                          'Usuários ativos',
                          Icons.people,
                        ),
                        _buildStatisticCard(
                          'R\$ 50M+',
                          'Em empréstimos gerenciados',
                          Icons.attach_money,
                        ),
                        _buildStatisticCard(
                          '4.8/5',
                          'Avaliação na Play Store',
                          Icons.star,
                        ),
                      ],
                    ).animate().fadeIn().slideY(begin: 0.3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBackgroundParticles() {
    return List.generate(80, (index) {
      // Variação no tamanho das partículas
      final size = _random.nextDouble() * 4 + 1;

      // Distribuição em toda a tela com mais concentração nas laterais
      final x = _random.nextDouble() * MediaQuery.of(context).size.width;
      final y = _random.nextDouble() * MediaQuery.of(context).size.height;

      // Velocidade de movimento variável
      final speed = _random.nextDouble() * 2 + 1;

      return AnimatedBuilder(
        animation: _particleController,
        builder: (context, child) {
          final progress = _particleController.value * speed;

          // Movimento orbital suave
          final offset = Offset(
            x + math.sin((progress + index) * math.pi) * 50,
            y + math.cos((progress + index) * math.pi) * 30,
          );

          return Positioned(
            left: offset.dx,
            top: offset.dy,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: 0.3 + (_floatingController.value * 0.3),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primaryGreen.withOpacity(0.6),
                      AppColors.primaryGreen.withOpacity(0.0),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryGreen.withOpacity(0.2),
                      blurRadius: size * 2,
                      spreadRadius: size / 2,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildRadialGlow() {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _floatingController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppColors.primaryGreen
                      .withOpacity(0.1 * _floatingController.value),
                  Colors.transparent,
                ],
                center: Alignment.center,
                radius: 1.0 + (_floatingController.value * 0.2),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedGrid() {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _particleController,
        builder: (context, child) {
          return CustomPaint(
            painter: GridPainter(
              progress: _particleController.value,
              color: AppColors.primaryGreen.withOpacity(0.1),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBackgroundMist() {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _floatingController,
        builder: (context, child) {
          return CustomPaint(
            painter: MistPainter(
              progress: _floatingController.value,
              color: AppColors.primaryGreen,
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionOutline() {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _particleController,
        builder: (context, child) {
          return CustomPaint(
            painter: SectionOutlinePainter(
              progress: _particleController.value,
              color: AppColors.primaryGreen,
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatisticCard(String value, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryGreen.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: -5,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.primaryGreen,
            size: 32,
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final double progress;
  final Color color;

  GridPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const spacing = 50.0;
    final xCount = (size.width / spacing).ceil();
    final yCount = (size.height / spacing).ceil();

    // Desenha linhas horizontais
    for (var i = 0; i <= yCount; i++) {
      final y = i * spacing + (progress * spacing);
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }

    // Desenha linhas verticais
    for (var i = 0; i <= xCount; i++) {
      final x = i * spacing + (progress * spacing);
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(GridPainter oldDelegate) => true;
}

class MistPainter extends CustomPainter {
  final double progress;
  final Color color;

  MistPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 32);

    final height = size.height;
    final width = size.width;

    // Criar pontos de névoa em diferentes posições
    final points = [
      Offset(width * 0.2, height * 0.3),
      Offset(width * 0.8, height * 0.2),
      Offset(width * 0.1, height * 0.8),
      Offset(width * 0.9, height * 0.7),
      Offset(width * 0.5, height * 0.5),
    ];

    for (final point in points) {
      final gradient = RadialGradient(
        colors: [
          color.withOpacity(0.05 * progress),
          color.withOpacity(0.0),
        ],
        radius: 1.0 + (progress * 0.5),
      );

      paint.shader = gradient.createShader(
        Rect.fromCircle(center: point, radius: width * 0.3),
      );

      canvas.drawCircle(point, width * 0.3, paint);
    }
  }

  @override
  bool shouldRepaint(MistPainter oldDelegate) => true;
}

class LogoBackgroundPainter extends CustomPainter {
  final double progress;
  final Color color;

  LogoBackgroundPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.2)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Desenha pontos decorativos
    for (var i = 0; i < 12; i++) {
      final angle = (i * math.pi / 6) + (progress * 2 * math.pi);
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      canvas.drawCircle(Offset(x, y), 2, paint);
    }

    // Desenha linhas conectando os pontos
    for (var i = 0; i < 12; i++) {
      if (i % 2 == 0) {
        final angle1 = (i * math.pi / 6) + (progress * 2 * math.pi);
        final angle2 = ((i + 2) * math.pi / 6) + (progress * 2 * math.pi);

        final x1 = center.dx + radius * math.cos(angle1);
        final y1 = center.dy + radius * math.sin(angle1);
        final x2 = center.dx + radius * math.cos(angle2);
        final y2 = center.dy + radius * math.sin(angle2);

        canvas.drawLine(
          Offset(x1, y1),
          Offset(x2, y2),
          paint..color = color.withOpacity(0.1),
        );
      }
    }
  }

  @override
  bool shouldRepaint(LogoBackgroundPainter oldDelegate) => true;
}

class SectionOutlinePainter extends CustomPainter {
  final double progress;
  final Color color;

  SectionOutlinePainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.1)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final width = size.width;
    final height = size.height;
    final frequency = 2 * math.pi; // Movido para fora do loop

    // Desenha linhas de fluxo
    final path = Path();
    final count = 5;

    for (var i = 0; i < count; i++) {
      final verticalOffset = height * (i / (count - 1));
      final waveHeight = 50.0;

      path.moveTo(0, verticalOffset);

      for (var x = 0.0; x <= width; x += 2) {
        final normalizedX = x / width;
        final wave =
            math.sin(frequency * (normalizedX + progress)) * waveHeight;
        final y = verticalOffset + wave;

        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);

    // Desenha pontos de interseção
    paint
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.2);

    for (var x = 0; x <= width; x += 100) {
      for (var y = 0; y <= height; y += 100) {
        final wave = math.sin(frequency * ((x / width) + progress)) * 20;
        canvas.drawCircle(
          Offset(x.toDouble(), (y + wave).toDouble()), // Adicionando wave ao y
          2,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(SectionOutlinePainter oldDelegate) => true;
}
