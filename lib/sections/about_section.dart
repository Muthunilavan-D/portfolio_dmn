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
        vertical: 70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(),
              const SizedBox(height: 36),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.surfaceElevated,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppTheme.borderSubtle),
          ),
          child: const Text(
            'ENGINEERING PHILOSOPHY',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppTheme.textSecondary,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Driven by Architecture. Tested in Production.',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'How I approach system design, software engineering fundamentals, and high-impact problem solving.',
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopCards() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: _AboutCard(
                number: '01',
                title: 'System Craftsmanship',
                subtitle: 'Clean Architecture & Predictability',
                description:
                    'I believe software quality is defined by clarity, maintainability, and predictable state. I build systems end-to-end, separating business logic cleanly from delivery mechanisms.',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _AboutCard(
                number: '02',
                title: 'Cross-Platform Flutter',
                subtitle: 'Pixel-perfect mobile & web systems',
                description:
                    'Deep expertise in Flutter and Dart, building responsive applications with robust offline-first caching, reactive state management (Provider/Riverpod), and native integrations.',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: _AboutCard(
                number: '03',
                title: 'Backend & Data Services',
                subtitle: 'Scalable APIs & Datastores',
                description:
                    'Designing robust RESTful services using Node.js, Express, MongoDB, and Firebase. Focused on low-latency response times, schema integrity, and secure authentication pipelines.',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _AboutCard(
                number: '04',
                title: 'Explainable AI (XAI)',
                subtitle: 'Transparent machine intelligence',
                description:
                    'Pioneering Explainable AI in academic workflows using SHAP values and modern LLM orchestration (Groq Cloud, Gemini API) to provide actionable, auditable risk evaluations.',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileCards() {
    return Column(
      children: const [
        _AboutCard(
          number: '01',
          title: 'System Craftsmanship',
          subtitle: 'Clean Architecture & Predictability',
          description:
              'I believe software quality is defined by clarity, maintainability, and predictable state. I build systems end-to-end, separating business logic cleanly from delivery mechanisms.',
        ),
        SizedBox(height: 12),
        _AboutCard(
          number: '02',
          title: 'Cross-Platform Flutter',
          subtitle: 'Pixel-perfect mobile & web systems',
          description:
              'Deep expertise in Flutter and Dart, building responsive applications with robust offline-first caching, reactive state management (Provider/Riverpod), and native integrations.',
        ),
        SizedBox(height: 12),
        _AboutCard(
          number: '03',
          title: 'Backend & Data Services',
          subtitle: 'Scalable APIs & Datastores',
          description:
              'Designing robust RESTful services using Node.js, Express, MongoDB, and Firebase. Focused on low-latency response times, schema integrity, and secure authentication pipelines.',
        ),
        SizedBox(height: 12),
        _AboutCard(
          number: '04',
          title: 'Explainable AI (XAI)',
          subtitle: 'Transparent machine intelligence',
          description:
              'Pioneering Explainable AI in academic workflows using SHAP values and modern LLM orchestration (Groq Cloud, Gemini API) to provide actionable, auditable risk evaluations.',
        ),
      ],
    );
  }
}

class _AboutCard extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final String description;

  const _AboutCard({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                number,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textSecondary,
                  letterSpacing: 1.0,
                ),
              ),
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppTheme.borderMedium,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textMuted,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
