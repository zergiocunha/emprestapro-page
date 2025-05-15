import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html';

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

// ignore_for_file: use_full_hex_values_for_flutter_colors

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

class Feature {
  final IconData icon;
  final String title;
  final String description;

  const Feature({
    required this.icon,
    required this.title,
    required this.description,
  });
}

final List<Feature> features = [
  const Feature(
    icon: Icons.security,
    title: 'Segurança Total',
    description:
        'Seus dados e de seus clientes protegidos com criptografia de ponta a ponta.',
  ),
  const Feature(
    icon: Icons.notifications_active,
    title: 'Lembretes Automáticos',
    description:
        'Nunca perca uma data de pagamento com nosso sistema inteligente de notificações.',
  ),
  const Feature(
    icon: Icons.analytics,
    title: 'Relatórios Detalhados',
    description:
        'Acompanhe seu negócio com relatórios completos e gráficos intuitivos.',
  ),
  const Feature(
    icon: Icons.cloud_done,
    title: 'Backup na Nuvem',
    description:
        'Seus dados sempre seguros e acessíveis de qualquer dispositivo.',
  ),
  const Feature(
    icon: Icons.speed,
    title: 'Interface Rápida',
    description: 'Sistema otimizado para oferecer a melhor experiência de uso.',
  ),
  const Feature(
    icon: Icons.support_agent,
    title: 'Suporte Premium',
    description:
        'Atendimento especializado para ajudar em todas as suas dúvidas.',
  ),
];

class Testimonial {
  final String name;
  final String feedback;

  const Testimonial({
    required this.name,
    required this.feedback,
  });
}

final List<Testimonial> testimonials = [
  const Testimonial(
    name: 'João Silva',
    feedback:
        'O EmprestaPro revolucionou meu negócio. Agora tenho controle total dos meus empréstimos e nunca mais perdi um pagamento.',
  ),
  const Testimonial(
    name: 'Maria Santos',
    feedback:
        'Interface intuitiva e suporte excelente. Recomendo para todos os profissionais da área.',
  ),
  const Testimonial(
    name: 'Carlos Oliveira',
    feedback:
        'Antes eu anotava tudo no caderno, agora tenho tudo no app. Nota 10!',
  ),
  const Testimonial(
    name: 'Ana Costa',
    feedback:
        'Desde que comecei a usar o EmprestaPro, minha produtividade aumentou em 50%. Vale cada centavo!',
  ),
];

class EmprestaProLandingPage extends StatelessWidget {
  const EmprestaProLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.background.withOpacity(0.9),
                AppColors.background.withOpacity(0),
              ],
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: LayoutBuilder(
              builder: (context, constraints) {
                final isSmallScreen = MediaQuery.of(context).size.width < 600;

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 40,
                    ),
                    if (!isSmallScreen) ...[
                      const SizedBox(width: 12),
                      const Text(
                        'EmprestaPro',
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
            actions: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final isSmallScreen = MediaQuery.of(context).size.width < 600;

                  if (isSmallScreen) {
                    return PopupMenuButton<String>(
                      icon:
                          const Icon(Icons.menu, color: AppColors.primaryGreen),
                      onSelected: (value) async {
                        switch (value) {
                          case 'download':
                            final Uri url = Uri.parse(
                                'https://play.google.com/store/apps/details?id=com.emprestapro.app');
                            try {
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              }
                            } catch (e) {
                              window.open(url.toString(), '_blank');
                            }
                            break;
                          case 'contact':
                            final Uri url =
                                Uri.parse('https://wa.me/5511964549801');
                            try {
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              }
                            } catch (e) {
                              window.open(url.toString(), '_blank');
                            }
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem(
                          value: 'download',
                          child: Row(
                            children: [
                              Icon(Icons.phone_android,
                                  color: AppColors.primaryGreen),
                              SizedBox(width: 8),
                              Text('Baixar App'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'contact',
                          child: Row(
                            children: [
                              Icon(Icons.support_agent,
                                  color: AppColors.primaryGreen),
                              SizedBox(width: 8),
                              Text('Fale Conosco'),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.phone_android,
                            color: AppColors.primaryGreen),
                        onPressed: () async {
                          final Uri url = Uri.parse(
                              'https://play.google.com/store/apps/details?id=com.emprestapro.app');
                          try {
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url,
                                  mode: LaunchMode.externalApplication);
                            }
                          } catch (e) {
                            window.open(url.toString(), '_blank');
                          }
                        },
                        label: const Text('Baixar App',
                            style: TextStyle(color: AppColors.primaryText)),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.support_agent),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          foregroundColor: AppColors.primaryText,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          final Uri url =
                              Uri.parse('https://wa.me/5511964549801');
                          try {
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url,
                                  mode: LaunchMode.externalApplication);
                            }
                          } catch (e) {
                            window.open(url.toString(), '_blank');
                          }
                        },
                        label: const Text('Fale Conosco'),
                      ),
                      const SizedBox(width: 24),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.mainBackground),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HeroSection(),
              _Divider(),
              _FeaturesSection(),
              _Divider(),
              _AppShowcaseSection(),
              _Divider(),
              _TestimonialSection(),
              _Divider(),
              _PricingSection(),
              _Divider(),
              _CallToActionSection(),
              _Divider(),
              _FaqSection(),
              _Divider(),
              _FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
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
              _StatisticWidget(
                value: '10.000+',
                label: 'Usuários ativos',
              ),
              _StatisticWidget(
                value: 'R\$ 50M+',
                label: 'Em empréstimos gerenciados',
              ),
              _StatisticWidget(
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

class _StatisticWidget extends StatelessWidget {
  final String value;
  final String label;

  const _StatisticWidget({required this.value, required this.label});

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

class _FeaturesSection extends StatelessWidget {
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
                            child: _FeatureCard(
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

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
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

class _AppShowcaseSection extends StatelessWidget {
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
                const _AppScreenshot(
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

class _AppScreenshot extends StatelessWidget {
  final String image;
  final String title;

  const _AppScreenshot({required this.image, required this.title});

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

class _TestimonialSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.mainBackground),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          const ScrollAnimatedWidget(
            slideOffset: -0.2,
            child: Text(
              'Depoimentos de quem já usa o EmprestaPro',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 24,
            children: [
              for (var i = 0; i < testimonials.length; i++)
                ScrollAnimatedWidget(
                  delay: (i * 150).ms,
                  slideOffset: 0.3,
                  child: _TestimonialCard(
                    name: testimonials[i].name,
                    feedback: testimonials[i].feedback,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String name;
  final String feedback;

  const _TestimonialCard({required this.name, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryGreen.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -20,
            right: -20,
            child: Icon(
              Icons.format_quote,
              color: AppColors.primaryGreen.withOpacity(0.1),
              size: 80,
            ),
          ),
          Column(
            children: [
              Text(
                feedback,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 16,
                  height: 1.6,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryGreen.withOpacity(0.1),
                      AppColors.primaryGreen.withOpacity(0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PricingSection extends StatelessWidget {
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
                child: const _PricingCard(
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
                child: const _PricingCard(
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

class _PricingCard extends StatefulWidget {
  final String title;
  final String price;
  final List<String> features;
  final bool isPopular;

  const _PricingCard({
    required this.title,
    required this.price,
    required this.features,
    required this.isPopular,
  });

  @override
  State<_PricingCard> createState() => _PricingCardState();
}

class _PricingCardState extends State<_PricingCard> {
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

class _CallToActionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.accentGlow),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          const Text(
            'Comece agora a transformar seu controle financeiro',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ).animate().fadeIn(),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {},
            child: const Text(
              'Testar gratuitamente',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ).animate().fadeIn().slideY(begin: 0.2),
        ],
      ),
    );
  }
}

class _FaqSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.mainBackground),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          const Text(
            'Dúvidas Frequentes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ).animate().fadeIn(),
          const SizedBox(height: 32),
          ...[
            const _FaqItem(
              question: 'O app é seguro?',
              answer:
                  'Sim! Utilizamos criptografia de ponta a ponta e seus dados são armazenados com segurança em servidores protegidos.',
            ),
            const _FaqItem(
              question: 'Como funciona o período gratuito?',
              answer:
                  'Você tem 14 dias para testar todas as funcionalidades do plano Profissional, sem compromisso.',
            ),
          ].animate(interval: 150.ms).fadeIn(),
        ],
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryGreen.withOpacity(0.2),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.question,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 200),
                      turns: isExpanded ? 0.25 : 0,
                      child: const Icon(
                        Icons.chevron_right,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      widget.answer,
                      style: const TextStyle(
                        color: AppColors.secoundaryText,
                        height: 1.5,
                      ),
                    ),
                  ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
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

class ScrollAnimatedWidget extends StatefulWidget {
  final Widget child;
  final double? slideOffset;
  final Duration? delay;
  final Duration? duration;

  const ScrollAnimatedWidget({
    super.key,
    required this.child,
    this.slideOffset,
    this.delay,
    this.duration,
  });

  @override
  State<ScrollAnimatedWidget> createState() => _ScrollAnimatedWidgetState();
}

class _ScrollAnimatedWidgetState extends State<ScrollAnimatedWidget> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !isVisible) {
          setState(() {
            isVisible = true;
          });
        }
      },
      child: widget.child
          .animate(
            target: isVisible ? 1 : 0,
          )
          .fadeIn(
            duration: widget.duration ?? 800.ms,
            delay: widget.delay ?? 0.ms,
          )
          .slideY(
            begin: widget.slideOffset ?? 0.2,
            duration: widget.duration ?? 800.ms,
            delay: widget.delay ?? 0.ms,
          ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.primaryGreen.withOpacity(0.3),
            Colors.transparent,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
