import 'package:flutter/material.dart';

import '../models/feature.dart';
import '../models/testimonial.dart';

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
