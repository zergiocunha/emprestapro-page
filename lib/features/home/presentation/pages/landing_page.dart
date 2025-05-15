import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/divider_widget.dart';
import '../widgets/sections/app_showcase_section.dart';
import '../widgets/sections/call_to_action_section.dart';
import '../widgets/sections/faq_section.dart';
import '../widgets/sections/features_section.dart';
import '../widgets/sections/footer_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/pricing_section.dart';
import '../widgets/sections/testimonial_section.dart';

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
              const HeroSection(),
              const DividerWidget(),
              FeaturesSection(),
              const DividerWidget(),
              AppShowcaseSection(),
              const DividerWidget(),
              const TestimonialSection(),
              const DividerWidget(),
              const PricingSection(),
              const DividerWidget(),
              const CallToActionSection(),
              const DividerWidget(),
              const FaqSection(),
              const DividerWidget(),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
