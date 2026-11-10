import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class ExperienceEducationSection extends StatelessWidget {
  const ExperienceEducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'EDUCATION & EXPERIENCE',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 36,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.neonBlue,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth > 768;

                  if (isDesktop) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Education Section (First)
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Education',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.neonPurple,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              // BE Education Card
                              GlassCard(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                        gradient: AppTheme.neonGradient,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppTheme.neonBlue
                                                .withOpacity(0.3),
                                            blurRadius: 15,
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.school_outlined,
                                        color: Colors.white,
                                        size: 36,
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Bachelor of Engineering',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.neonBlue,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Computer Science Engineering',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: AppTheme.textSecondary,
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.business,
                                                size: 18,
                                                color: AppTheme.neonPurple,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                'Velammal College of Engineering',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 14,
                                                      vertical: 8,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: AppTheme.neonPurple
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: AppTheme.neonPurple,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_today,
                                                      size: 14,
                                                      color:
                                                          AppTheme.neonPurple,
                                                    ),
                                                    const SizedBox(width: 6),
                                                    Text(
                                                      '2023 – 2027',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            AppTheme.neonPurple,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8,
                                                    ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      AppTheme.neonBlue
                                                          .withOpacity(0.3),
                                                      AppTheme.neonPurple
                                                          .withOpacity(0.3),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: AppTheme.neonBlue,
                                                    width: 1.5,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppTheme.neonBlue
                                                          .withOpacity(0.2),
                                                      blurRadius: 10,
                                                      spreadRadius: 0,
                                                    ),
                                                  ],
                                                ),
                                                child: Text(
                                                  'CGPA: 8.65 / 10',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppTheme.neonBlue,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              // HSE Education Card
                              GlassCard(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                        gradient: AppTheme.neonGradient,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppTheme.neonBlue
                                                .withOpacity(0.3),
                                            blurRadius: 15,
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.school_outlined,
                                        color: Colors.white,
                                        size: 36,
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'HSE',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.neonBlue,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Computer Science',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: AppTheme.textSecondary,
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.business,
                                                size: 18,
                                                color: AppTheme.neonPurple,
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  'Akshara Matriculation Higher Secondary School',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  softWrap: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 14,
                                                      vertical: 8,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: AppTheme.neonPurple
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: AppTheme.neonPurple,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_today,
                                                      size: 14,
                                                      color:
                                                          AppTheme.neonPurple,
                                                    ),
                                                    const SizedBox(width: 6),
                                                    Text(
                                                      '2022 – 2023',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            AppTheme.neonPurple,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8,
                                                    ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      AppTheme.neonBlue
                                                          .withOpacity(0.3),
                                                      AppTheme.neonPurple
                                                          .withOpacity(0.3),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: AppTheme.neonBlue,
                                                    width: 1.5,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppTheme.neonBlue
                                                          .withOpacity(0.2),
                                                      blurRadius: 10,
                                                      spreadRadius: 0,
                                                    ),
                                                  ],
                                                ),
                                                child: Text(
                                                  '83.67%',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppTheme.neonBlue,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              const _CertificationsCard(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        // Experience Section (Second)
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Experience',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.neonPurple,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Timeline indicator
                                  Column(
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          gradient: AppTheme.neonGradient,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppTheme.neonBlue
                                                  .withOpacity(0.5),
                                              blurRadius: 10,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 2,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              AppTheme.neonBlue.withOpacity(
                                                0.5,
                                              ),
                                              Colors.transparent,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                    child: GlassCard(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(
                                                  12,
                                                ),
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      AppTheme.neonGradient,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: const Icon(
                                                  Icons.work_outline,
                                                  color: Colors.white,
                                                  size: 28,
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Flutter Developer Intern',
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            AppTheme.neonBlue,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 6),
                                                    Text(
                                                      'AstroWeb Solutions Pvt. Limited',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 6),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 6,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .neonPurple
                                                            .withOpacity(0.2),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              20,
                                                            ),
                                                        border: Border.all(
                                                          color: AppTheme
                                                              .neonPurple,
                                                          width: 1,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'May 2025 – June 2025',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: AppTheme
                                                              .neonPurple,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 28),
                                          const Divider(
                                            color: AppTheme.spaceGray,
                                          ),
                                          const SizedBox(height: 20),
                                          _BulletPoint(
                                            text:
                                                'Built real-world mobile app features',
                                          ),
                                          _BulletPoint(
                                            text:
                                                'Integrated APIs and Firebase services',
                                          ),
                                          _BulletPoint(
                                            text:
                                                'Improved code structure and UI responsiveness',
                                          ),
                                          _BulletPoint(
                                            text:
                                                'Collaborated in professional development workflow',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              const _AccomplishmentsCard(),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        // Education (First)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Education',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.neonPurple,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            // BE Education Card
                            GlassCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      gradient: AppTheme.neonGradient,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(
                                      Icons.school_outlined,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Bachelor of Engineering',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.neonBlue,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Computer Science Engineering',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.textSecondary,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.business,
                                        size: 16,
                                        color: AppTheme.neonPurple,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Velammal College of Engineering',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Wrap(
                                    spacing: 12,
                                    runSpacing: 12,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppTheme.neonPurple
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: AppTheme.neonPurple,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              size: 14,
                                              color: AppTheme.neonPurple,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              '2023 – 2027',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: AppTheme.neonPurple,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              AppTheme.neonBlue.withOpacity(
                                                0.3,
                                              ),
                                              AppTheme.neonPurple.withOpacity(
                                                0.3,
                                              ),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: AppTheme.neonBlue,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Text(
                                          'CGPA: 8.65 / 10',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.neonBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            // HSE Education Card
                            GlassCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      gradient: AppTheme.neonGradient,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(
                                      Icons.school_outlined,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'HSE',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.neonBlue,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Computer Science',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.textSecondary,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.business,
                                        size: 16,
                                        color: AppTheme.neonPurple,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Akshara Matriculation Higher Secondary School',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppTheme.neonPurple
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: AppTheme.neonPurple,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              size: 14,
                                              color: AppTheme.neonPurple,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              '2022 – 2023',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: AppTheme.neonPurple,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              AppTheme.neonBlue.withOpacity(
                                                0.3,
                                              ),
                                              AppTheme.neonPurple.withOpacity(
                                                0.3,
                                              ),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: AppTheme.neonBlue,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Text(
                                          '83.67%',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.neonBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            const _CertificationsCard(),
                          ],
                        ),
                        const SizedBox(height: 40),
                        // Experience (Second)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Experience',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.neonPurple,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            GlassCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          gradient: AppTheme.neonGradient,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.work_outline,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Flutter Developer Intern',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.neonBlue,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              'AstroWeb Solutions Pvt. Limited',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 6,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: AppTheme.neonPurple
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: AppTheme.neonPurple,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                'May 2025 – June 2025',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppTheme.neonPurple,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 28),
                                  const Divider(color: AppTheme.spaceGray),
                                  const SizedBox(height: 20),
                                  _BulletPoint(
                                    text:
                                        'Built real-world mobile app features',
                                  ),
                                  _BulletPoint(
                                    text:
                                        'Integrated APIs and Firebase services',
                                  ),
                                  _BulletPoint(
                                    text:
                                        'Improved code structure and UI responsiveness',
                                  ),
                                  _BulletPoint(
                                    text:
                                        'Collaborated in professional development workflow',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            const _AccomplishmentsCard(),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 16),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppTheme.neonBlue,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: AppTheme.textSecondary,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _AccomplishmentsCard extends StatelessWidget {
  const _AccomplishmentsCard();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD700), Color(0xFFFF8C00)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFD700).withOpacity(0.3),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.emoji_events,
                  color: Colors.black,
                  size: 28,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Honors & Hackathons',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.neonBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Competitions & Academic Recognition',
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
          const SizedBox(height: 24),
          const Divider(color: AppTheme.spaceGray),
          const SizedBox(height: 16),
          const _AwardRow(
            title: 'Euphoria 2k25 — AI Code Sprint',
            award: 'Winner (₹5,000)',
            isGold: true,
          ),
          const _AwardRow(
            title: 'Euphoria 2k25 — Creative App Sparks',
            award: 'Runner-Up (₹3,000)',
            isGold: false,
          ),
          const _AwardRow(
            title: 'Academic Top Scorer (3rd Semester)',
            award: 'GPA: 9.18',
            isGold: true,
          ),
          const _AwardRow(
            title: 'Elements 2k24 — Codeathon',
            award: 'Participant',
            isGold: false,
          ),
        ],
      ),
    );
  }
}

class _AwardRow extends StatelessWidget {
  final String title;
  final String award;
  final bool isGold;

  const _AwardRow({
    required this.title,
    required this.award,
    required this.isGold,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            isGold ? Icons.military_tech : Icons.workspace_premium,
            color: isGold ? const Color(0xFFFFD700) : AppTheme.neonPurple,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: (isGold ? const Color(0xFFFFD700) : AppTheme.neonPurple)
                  .withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isGold ? const Color(0xFFFFD700) : AppTheme.neonPurple,
                width: 1,
              ),
            ),
            child: Text(
              award,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isGold ? const Color(0xFFFFD700) : AppTheme.neonPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CertificationsCard extends StatelessWidget {
  const _CertificationsCard();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: AppTheme.neonGradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.neonBlue.withOpacity(0.3),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.verified,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Certifications',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.neonBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Professional & Academic Credentials',
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
          const SizedBox(height: 24),
          const Divider(color: AppTheme.spaceGray),
          const SizedBox(height: 16),
          const _CertItem(
            title: 'Flutter & Dart Development',
            issuer: 'Udemy',
            icon: Icons.flutter_dash,
          ),
          const _CertItem(
            title: 'SQL and Relational Databases',
            issuer: 'IBM',
            icon: Icons.storage,
          ),
          const _CertItem(
            title: 'Cloud Computing',
            issuer: 'NPTEL (IIT)',
            icon: Icons.cloud_done,
          ),
          const _CertItem(
            title: 'Cloud Computing',
            issuer: 'Wipro',
            icon: Icons.cloud_queue,
          ),
        ],
      ),
    );
  }
}

class _CertItem extends StatelessWidget {
  final String title;
  final String issuer;
  final IconData icon;

  const _CertItem({
    required this.title,
    required this.issuer,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppTheme.neonBlue.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: AppTheme.neonBlue),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.spaceGray,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppTheme.neonBlue.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              issuer,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.neonBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
