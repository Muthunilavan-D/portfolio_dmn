import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class ExperienceEducationSection extends StatelessWidget {
  const ExperienceEducationSection({super.key});

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
                _buildMobileLayout()
              else
                _buildDesktopLayout(),
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
            'TRACK RECORD',
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
          'Education, Experience & Honors',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Academic excellence, commercial internship contributions, and competitive hackathon awards.',
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column: Education & Certifications
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubheader('Education & Certifications'),
              const SizedBox(height: 16),
              _buildBECard(),
              const SizedBox(height: 14),
              _buildHSCCard(),
              const SizedBox(height: 14),
              _buildCertificationsCard(),
            ],
          ),
        ),
        const SizedBox(width: 24),
        // Right Column: Experience & Honors
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubheader('Experience & Honors'),
              const SizedBox(height: 16),
              _buildExperienceCard(),
              const SizedBox(height: 14),
              _buildHonorsCard(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubheader('Education & Certifications'),
        const SizedBox(height: 16),
        _buildBECard(),
        const SizedBox(height: 14),
        _buildHSCCard(),
        const SizedBox(height: 14),
        _buildCertificationsCard(),
        const SizedBox(height: 32),
        _buildSubheader('Experience & Honors'),
        const SizedBox(height: 16),
        _buildExperienceCard(),
        const SizedBox(height: 14),
        _buildHonorsCard(),
      ],
    );
  }

  Widget _buildSubheader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppTheme.textPrimary,
        letterSpacing: -0.2,
      ),
    );
  }

  Widget _buildBECard() {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Bachelor of Engineering (B.E.)',
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceElevated,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppTheme.borderSubtle),
                ),
                child: const Text(
                  '2023 – 2027',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Computer Science and Engineering',
            style: TextStyle(
              fontSize: 13.5,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Velammal College of Engineering and Technology, Madurai',
            style: TextStyle(
              fontSize: 13.5,
              color: AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildBadge('CGPA: 8.65 / 10', isHighlighted: true),
              _buildBadge('Semester 3 GPA: 9.18'),
              _buildBadge('Autonomous • Anna Univ'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHSCCard() {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Higher Secondary (HSC)',
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceElevated,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppTheme.borderSubtle),
                ),
                child: const Text(
                  '2021 – 2023',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Computer Science & Mathematics Stream',
            style: TextStyle(
              fontSize: 13.5,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Akshara Matriculation Higher Secondary School, Madurai',
            style: TextStyle(
              fontSize: 13.5,
              color: AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: 14),
          _buildBadge('Score: 83.67%', isHighlighted: true),
        ],
      ),
    );
  }

  Widget _buildExperienceCard() {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(22),
      borderColor: AppTheme.borderMedium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Flutter Developer Intern',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceElevated,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppTheme.borderSubtle),
                ),
                child: const Text(
                  'May – Jun 2025',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'AstroWeb Solutions Pvt. Limited',
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 14),
          const Divider(color: AppTheme.borderSubtle),
          const SizedBox(height: 12),
          _buildBulletItem('Engineered core mobile app features and responsive UI screens using Flutter & Dart.'),
          _buildBulletItem('Integrated REST APIs, Firebase Authentication, and Cloud Firestore services.'),
          _buildBulletItem('Participated in agile sprints, code reviews, and performance optimizations.'),
          _buildBulletItem('Refactored state management to ensure low memory footprint and fluid animations.'),
        ],
      ),
    );
  }

  Widget _buildHonorsCard() {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Honors & Hackathon Awards',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Competitive programming & technical innovation',
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: 16),
          _buildAwardRow(
            title: 'Euphoria 2k25 — AI Code Sprint',
            award: 'Winner (₹5,000)',
          ),
          _buildAwardRow(
            title: 'Euphoria 2k25 — Creative App Sparks',
            award: 'Runner-Up (₹3,000)',
          ),
          _buildAwardRow(
            title: 'Academic Rank Holder (Semester 3)',
            award: 'GPA: 9.18 / 10',
          ),
          _buildAwardRow(
            title: 'Elements 2k24 — Codeathon',
            award: 'Finalist',
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationsCard() {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Professional Certifications',
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Verified industry & academic credentials',
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: 16),
          _buildCertRow('Cloud Computing', 'NPTEL (IIT)'),
          _buildCertRow('Cloud Computing', 'Wipro'),
          _buildCertRow('SQL and Relational Databases', 'IBM'),
          _buildCertRow('Flutter & Dart Development', 'Udemy'),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, {bool isHighlighted = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isHighlighted ? AppTheme.surfaceElevated : AppTheme.darkSpace,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isHighlighted ? AppTheme.borderMedium : AppTheme.borderSubtle,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isHighlighted ? FontWeight.w700 : FontWeight.w500,
          color: isHighlighted ? AppTheme.textPrimary : AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildBulletItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, right: 10),
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: AppTheme.textSecondary,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13.5,
                color: AppTheme.textMuted,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAwardRow({
    required String title,
    required String award,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13.5,
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppTheme.surfaceElevated,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppTheme.borderSubtle),
            ),
            child: Text(
              award,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertRow(String title, String issuer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13.5,
                color: AppTheme.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppTheme.surfaceElevated,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppTheme.borderSubtle),
            ),
            child: Text(
              issuer,
              style: const TextStyle(
                fontSize: 11.5,
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
