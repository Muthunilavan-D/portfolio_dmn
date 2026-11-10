import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 960;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSectionHeader(),
              const SizedBox(height: 48),
              if (isMobile)
                _buildMobileCards()
              else
                _buildDesktopCards(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.primaryLight.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: const Text(
            'ABOUT ME',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryLight,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Driven by Curiosity, Built for Impact',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'How I approach problem solving, architecture, and shipping scalable software.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopCards() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _AboutCard(
            icon: Icons.lightbulb_outline,
            title: 'Engineering Philosophy',
            subtitle: 'Consistency over shortcuts',
            description:
                'I learn best by building real products end-to-end. I prioritize clean code architecture, intuitive user flows, and measurable reliability. I care deeply about getting better every single day.',
            accentColor: AppTheme.primary,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _AboutCard(
            icon: Icons.hub_outlined,
            title: 'Full-Stack & AI Focus',
            subtitle: 'End-to-end system design',
            description:
                'Bridging performant cross-platform Flutter applications with scalable Node.js/Express and MongoDB backends. Experienced with Explainable AI (SHAP) and LLM-assisted decision workflows.',
            accentColor: AppTheme.secondary,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _AboutCard(
            icon: Icons.school_outlined,
            title: 'Education & Growth',
            subtitle: 'Velammal College of Engineering',
            description:
                'Pursuing B.E. in Computer Science (2023–2027) with an 8.65 CGPA. Passionate about collaborative development, participating in hackathons, and solving high-impact problems.',
            accentColor: AppTheme.emerald,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileCards() {
    return Column(
      children: [
        _AboutCard(
          icon: Icons.lightbulb_outline,
          title: 'Engineering Philosophy',
          subtitle: 'Consistency over shortcuts',
          description:
              'I learn best by building real products end-to-end. I prioritize clean code architecture, intuitive user flows, and measurable reliability. I care deeply about getting better every single day.',
          accentColor: AppTheme.primary,
        ),
        const SizedBox(height: 16),
        _AboutCard(
          icon: Icons.hub_outlined,
          title: 'Full-Stack & AI Focus',
          subtitle: 'End-to-end system design',
          description:
              'Bridging performant cross-platform Flutter applications with scalable Node.js/Express and MongoDB backends. Experienced with Explainable AI (SHAP) and LLM-assisted decision workflows.',
          accentColor: AppTheme.secondary,
        ),
        const SizedBox(height: 16),
        _AboutCard(
          icon: Icons.school_outlined,
          title: 'Education & Growth',
          subtitle: 'Velammal College of Engineering',
          description:
              'Pursuing B.E. in Computer Science (2023–2027) with an 8.65 CGPA. Passionate about collaborative development, participating in hackathons, and solving high-impact problems.',
          accentColor: AppTheme.emerald,
        ),
      ],
    );
  }
}

class _AboutCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final Color accentColor;

  const _AboutCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: accentColor.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Icon(icon, color: accentColor, size: 24),
          ),
          const SizedBox(height: 22),
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14.5,
              color: AppTheme.textSecondary,
              height: 1.65,
            ),
          ),
        ],
      ),
    );
  }
}
