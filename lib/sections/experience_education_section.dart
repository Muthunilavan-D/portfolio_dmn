import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class ExperienceEducationSection extends StatelessWidget {
  const ExperienceEducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 960;

    return Container(
      padding: EdgeInsets.only(
        top: 110,
        bottom: 80,
        left: isMobile ? 20 : 40,
        right: isMobile ? 20 : 40,
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
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0x33F59E0B),
                Color(0x22F43F5E),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.amber.withValues(alpha: 0.45),
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33F59E0B),
                blurRadius: 10,
              ),
            ],
          ),
          child: const Text(
            'JOURNEY & CREDENTIALS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppTheme.amber,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Education, Experience & Recognition',
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
          'Academic excellence, real-world development, and competitive hackathon achievements.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textSecondary,
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
              _buildSubheader('Education & Certifications', Icons.school_outlined, const Color(0xFF06B6D4)),
              const SizedBox(height: 18),
              _buildBECard(),
              const SizedBox(height: 16),
              _buildHSCCard(),
              const SizedBox(height: 16),
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
              _buildSubheader('Experience & Honors', Icons.work_outline, const Color(0xFFF59E0B)),
              const SizedBox(height: 18),
              _buildExperienceCard(),
              const SizedBox(height: 16),
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
        _buildSubheader('Education & Certifications', Icons.school_outlined, const Color(0xFF06B6D4)),
        const SizedBox(height: 18),
        _buildBECard(),
        const SizedBox(height: 16),
        _buildHSCCard(),
        const SizedBox(height: 16),
        _buildCertificationsCard(),
        const SizedBox(height: 36),
        _buildSubheader('Experience & Honors', Icons.work_outline, const Color(0xFFF59E0B)),
        const SizedBox(height: 18),
        _buildExperienceCard(),
        const SizedBox(height: 16),
        _buildHonorsCard(),
      ],
    );
  }

  Widget _buildSubheader(String title, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.16),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color.withValues(alpha: 0.35)),
          ),
          child: Icon(icon, size: 18, color: color),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }

  Widget _buildBECard() {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(24),
      glowColor: const Color(0xFF818CF8),
      borderColor: const Color(0xFF818CF8).withValues(alpha: 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0x336366F1), Color(0x184F46E5)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0x66818CF8)),
                ),
                child: const Icon(Icons.school, color: Color(0xFF818CF8), size: 22),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bachelor of Engineering (B.E.)',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Computer Science and Engineering',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Velammal College of Engineering and Technology, Madurai',
            style: TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w500,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: [
              _buildBadge('2023 – 2027 (Expected)', AppTheme.textSecondary),
              _buildBadge('CGPA: 8.65 / 10', const Color(0xFF06B6D4), isHighlighted: true),
              _buildBadge('Sem 3 GPA: 9.18', const Color(0xFF10B981)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHSCCard() {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(24),
      glowColor: const Color(0xFF06B6D4),
      borderColor: const Color(0xFF06B6D4).withValues(alpha: 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0x3306B6D4), Color(0x180EA5E9)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0x6606B6D4)),
                ),
                child: const Icon(Icons.menu_book, color: Color(0xFF06B6D4), size: 22),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Higher Secondary Certificate (HSC)',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Computer Science Stream',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Akshara Matriculation Higher Secondary School, Madurai',
            style: TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w500,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: [
              _buildBadge('2021 – 2023', AppTheme.textSecondary),
              _buildBadge('Score: 83.67%', const Color(0xFF06B6D4), isHighlighted: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard() {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(24),
      glowColor: const Color(0xFF818CF8),
      borderColor: const Color(0xFF818CF8).withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0x336366F1), Color(0x184F46E5)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0x66818CF8)),
                ),
                child: const Icon(Icons.business_center, color: Color(0xFF818CF8), size: 22),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter Developer Intern',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'AstroWeb Solutions Pvt. Limited',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _buildBadge('May 2025 – June 2025', const Color(0xFF818CF8)),
          const SizedBox(height: 16),
          const Divider(color: AppTheme.borderSubtle),
          const SizedBox(height: 12),
          _buildBulletItem('Engineered core mobile app features and responsive UI components using Flutter.'),
          _buildBulletItem('Integrated REST APIs, Firebase Authentication, and Cloud Firestore services.'),
          _buildBulletItem('Participated in agile sprints, code reviews, and performance optimizations with senior developers.'),
          _buildBulletItem('Collaborated closely on UI debugging, state management refactoring, and release staging.'),
        ],
      ),
    );
  }

  Widget _buildHonorsCard() {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(24),
      glowColor: const Color(0xFFF59E0B),
      borderColor: const Color(0xFFF59E0B).withValues(alpha: 0.45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0x33F59E0B), Color(0x18D97706)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0x66F59E0B)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33F59E0B),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const Icon(Icons.emoji_events, color: Color(0xFFF59E0B), size: 22),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Honors & Hackathon Awards',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Competitive programming & innovation',
                      style: TextStyle(
                        fontSize: 13.5,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildAwardRow(
            title: 'Euphoria 2k25 — AI Code Sprint',
            award: 'Winner (₹5,000)',
            icon: Icons.military_tech,
            color: const Color(0xFFF59E0B),
          ),
          _buildAwardRow(
            title: 'Euphoria 2k25 — Creative App Sparks',
            award: 'Runner-Up (₹3,000)',
            icon: Icons.workspace_premium,
            color: const Color(0xFF06B6D4),
          ),
          _buildAwardRow(
            title: 'Academic Top Scorer (Semester 3)',
            award: 'GPA: 9.18',
            icon: Icons.star_outline,
            color: const Color(0xFF818CF8),
          ),
          _buildAwardRow(
            title: 'Elements 2k24 — Codeathon',
            award: 'Participant',
            icon: Icons.code,
            color: AppTheme.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationsCard() {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(24),
      glowColor: const Color(0xFF10B981),
      borderColor: const Color(0xFF10B981).withValues(alpha: 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0x3310B981), Color(0x18059669)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0x6610B981)),
                ),
                child: const Icon(Icons.verified, color: Color(0xFF10B981), size: 22),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Professional Certifications',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Verified technical credentials',
                      style: TextStyle(
                        fontSize: 13.5,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _buildCertRow('Flutter & Dart Development', 'Udemy', Icons.flutter_dash, const Color(0xFF818CF8)),
          _buildCertRow('SQL and Relational Databases', 'IBM', Icons.storage_outlined, const Color(0xFF06B6D4)),
          _buildCertRow('Cloud Computing', 'NPTEL (IIT)', Icons.cloud_done_outlined, const Color(0xFF10B981)),
          _buildCertRow('Cloud Computing', 'Wipro', Icons.cloud_queue_outlined, const Color(0xFFF59E0B)),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color, {bool isHighlighted = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isHighlighted
            ? color.withValues(alpha: 0.18)
            : AppTheme.spaceGray,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isHighlighted
              ? color.withValues(alpha: 0.5)
              : AppTheme.borderSubtle,
          width: 1.2,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.5,
          fontWeight: isHighlighted ? FontWeight.w700 : FontWeight.w500,
          color: isHighlighted ? color : AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildBulletItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, right: 12),
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              color: Color(0xFF818CF8),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
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
    required IconData icon,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color.withValues(alpha: 0.45)),
            ),
            child: Text(
              award,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertRow(String title, String issuer, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 10),
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
              color: AppTheme.spaceGray,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: color.withValues(alpha: 0.35)),
            ),
            child: Text(
              issuer,
              style: TextStyle(
                fontSize: 11.5,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
