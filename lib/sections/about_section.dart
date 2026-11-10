import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 768 ? 40 : 20,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'ABOUT ME',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 768 ? 36 : 28,
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
                    Expanded(
                      flex: 1,
                      child: GlassCard(
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
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Who I Am',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.neonBlue,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Passionate Developer',
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
                            Text(
                              'I’m a BE CSE student who learns best by building. I enjoy exploring how things work, breaking problems down, and improving a little with every project I touch. I’m not in a rush to be perfect — I care more about being consistent and getting better every day.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 1,
                      child: GlassCard(
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
                                  ),
                                  child: const Icon(
                                    Icons.code,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'What I Do',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.neonPurple,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Full-Stack Development',
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
                            Text(
                              'I build cross-platform mobile and full-stack web applications that solve real problems, focusing on clean architecture, reliable logic, and fluid user experiences. I integrate modern backends (Node.js, Express, MongoDB, Firebase) and intelligent AI features (LLMs, XAI/SHAP) to make applications truly smart and impactful. Currently shipping production-ready projects and growing into a versatile full-stack & AI software engineer.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
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
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About Me',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.neonBlue,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Passionate Flutter Developer',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'I am a BE CSE student and Flutter developer passionate about building intelligent, scalable, and visually polished applications that solve real-world problems. I love blending clean UI, solid architecture, and modern technologies to create meaningful digital experiences.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'I have built projects ranging from Explainable AI academic project management platforms and AI fitness trackers to real-time price monitoring and news systems. I enjoy exploring new technologies, optimizing performance, and designing apps that feel simple, fast, and intuitive.',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppTheme.textSecondary,
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Currently, I am focused on full-stack development, mobile architecture with Flutter, and AI-powered decision support systems, aiming to build production-ready software that stands out both technically and visually.',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppTheme.textSecondary,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
