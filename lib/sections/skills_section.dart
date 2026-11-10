import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int _selectedFilterIndex = 0;

  final List<String> _filters = [
    'All (6)',
    'Mobile & Web',
    'Backend & DB',
    'AI & Systems',
    'Languages',
    'Cloud & Tools',
    'Core CS',
  ];

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
              const SizedBox(height: 32),
              _buildInteractiveFilterBar(),
              const SizedBox(height: 36),
              _buildSkillsGrid(context),
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
            gradient: LinearGradient(
              colors: [
                AppTheme.secondary.withValues(alpha: 0.20),
                const Color(0xFF06B6D4).withValues(alpha: 0.12),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.secondary.withValues(alpha: 0.45),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.secondary.withValues(alpha: 0.2),
                blurRadius: 10,
              ),
            ],
          ),
          child: const Text(
            'SKILLS & TOOLKIT',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppTheme.secondary,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Technologies & Architectural Capabilities',
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
          'A modern stack focused on mobile fluency, scalable web services, and AI decision systems.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveFilterBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_filters.length, (index) {
          final isSelected = _selectedFilterIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () {
                setState(() => _selectedFilterIndex = index);
              },
              borderRadius: BorderRadius.circular(20),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [
                            Color(0xFF6366F1),
                            Color(0xFF06B6D4),
                          ],
                        )
                      : null,
                  color: isSelected
                      ? null
                      : AppTheme.surfaceDark.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? Colors.white.withValues(alpha: 0.4)
                        : AppTheme.borderSubtle,
                    width: 1,
                  ),
                  boxShadow: [
                    if (isSelected)
                      const BoxShadow(
                        color: Color(0x666366F1),
                        blurRadius: 14,
                        offset: Offset(0, 3),
                      ),
                  ],
                ),
                child: Text(
                  _filters[index],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected
                        ? Colors.white
                        : AppTheme.textSecondary,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    final allCards = [
      _SkillData(
        title: 'Mobile & Web Platforms',
        icon: Icons.phone_android_outlined,
        accentColor: const Color(0xFF818CF8), // Indigo
        categoryIndex: 1,
        skills: const [
          'Flutter (Mobile & Web)',
          'Dart',
          'React 19 & Vite',
          'Material 3 & Responsive UI',
          'Provider & Riverpod',
          'HTML5 & Modern CSS',
        ],
      ),
      _SkillData(
        title: 'Backend & Databases',
        icon: Icons.storage_outlined,
        accentColor: const Color(0xFF06B6D4), // Cyan
        categoryIndex: 2,
        skills: const [
          'Node.js & Express.js',
          'MongoDB & Mongoose',
          'Firebase Auth & Firestore',
          'MySQL & Relational DBs',
          'RESTful API Architecture',
          'Web Scraping & Automation',
        ],
      ),
      _SkillData(
        title: 'AI & Data Intelligence',
        icon: Icons.psychology_outlined,
        accentColor: const Color(0xFFA855F7), // Violet
        categoryIndex: 3,
        skills: const [
          'Explainable AI (SHAP)',
          'Groq Cloud LLM Integration',
          'Google Gemini API',
          'NLP & Text Classification',
          'Predictive Risk Modeling',
          'Rule-based Hybrid Logic',
        ],
      ),
      _SkillData(
        title: 'Programming Languages',
        icon: Icons.code_outlined,
        accentColor: const Color(0xFFF43F5E), // Rose
        categoryIndex: 4,
        skills: const [
          'Java (OOP & System Design)',
          'Dart',
          'Python',
          'C Language',
          'JavaScript (ES6+)',
          'SQL',
        ],
      ),
      _SkillData(
        title: 'Tools & Cloud Deployment',
        icon: Icons.cloud_done_outlined,
        accentColor: const Color(0xFFF59E0B), // Amber
        categoryIndex: 5,
        skills: const [
          'Git & GitHub Workflows',
          'Postman API Testing',
          'Vercel & Render Deployment',
          'VS Code & Android Studio',
          'Figma UI/UX Prototyping',
          'Notion Project Mgmt',
        ],
      ),
      _SkillData(
        title: 'Core CS Foundations',
        icon: Icons.developer_board_outlined,
        accentColor: const Color(0xFF10B981), // Emerald
        categoryIndex: 6,
        skills: const [
          'Object-Oriented Design (OOP)',
          'Clean Architecture & MVVM',
          'Cloud Computing (NPTEL/Wipro)',
          'Operating Systems & Networks',
          'Offline-First Design (Hive)',
          'SDLC & Agile Development',
        ],
      ),
    ];

    // Filter cards based on selected filter
    final displayedCards = _selectedFilterIndex == 0
        ? allCards
        : allCards
            .where((c) => c.categoryIndex == _selectedFilterIndex)
            .toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth > 1024
            ? (constraints.maxWidth - 40) / 3
            : constraints.maxWidth > 680
                ? (constraints.maxWidth - 20) / 2
                : constraints.maxWidth;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: displayedCards.map((data) {
            return _SkillCard(
              title: data.title,
              icon: data.icon,
              accentColor: data.accentColor,
              skills: data.skills,
              width: cardWidth,
            );
          }).toList(),
        );
      },
    );
  }
}

class _SkillData {
  final String title;
  final IconData icon;
  final Color accentColor;
  final int categoryIndex;
  final List<String> skills;

  _SkillData({
    required this.title,
    required this.icon,
    required this.accentColor,
    required this.categoryIndex,
    required this.skills,
  });
}

class _SkillCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color accentColor;
  final List<String> skills;
  final double width;

  const _SkillCard({
    required this.title,
    required this.icon,
    required this.accentColor,
    required this.skills,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: width,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(24),
      glowColor: accentColor,
      borderColor: accentColor.withValues(alpha: 0.35),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 220),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        accentColor.withValues(alpha: 0.22),
                        accentColor.withValues(alpha: 0.08),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: accentColor.withValues(alpha: 0.5),
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: accentColor.withValues(alpha: 0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: accentColor, size: 20),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.map((skill) {
                return _InteractiveSkillChip(
                  skill: skill,
                  accentColor: accentColor,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _InteractiveSkillChip extends StatefulWidget {
  final String skill;
  final Color accentColor;

  const _InteractiveSkillChip({
    required this.skill,
    required this.accentColor,
  });

  @override
  State<_InteractiveSkillChip> createState() => _InteractiveSkillChipState();
}

class _InteractiveSkillChipState extends State<_InteractiveSkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        decoration: BoxDecoration(
          color: _isHovered
              ? widget.accentColor.withValues(alpha: 0.25)
              : AppTheme.spaceGray.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered
                ? widget.accentColor
                : widget.accentColor.withValues(alpha: 0.22),
            width: 1.2,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: widget.accentColor.withValues(alpha: 0.35),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Text(
          widget.skill,
          style: TextStyle(
            fontSize: 12.5,
            color: _isHovered ? Colors.white : AppTheme.textSecondary,
            fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
