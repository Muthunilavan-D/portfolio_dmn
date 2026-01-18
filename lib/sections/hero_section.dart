import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_button.dart';

class HeroSection extends StatelessWidget {
  final ScrollController? scrollController;

  const HeroSection({super.key, this.scrollController});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _downloadResume() async {
    // For web, you can trigger download
    await _launchURL(
      'https://github.com/Muthunilavan-D/portfolio_dmn/raw/main/assets/Resume_dmn.pdf',
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SizedBox(
      height: screenHeight > 0 ? screenHeight : 800,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: 100, // Add top padding to prevent navigation overlap
            bottom: 0,
            left: isMobile ? 20 : 60,
            right: isMobile ? 20 : 60,
          ),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 40 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: isMobile
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Avatar Image with enhanced styling
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.neonBlue,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.neonBlue.withOpacity(0.6),
                              blurRadius: 40,
                              spreadRadius: 8,
                            ),
                            BoxShadow(
                              color: AppTheme.neonPurple.withOpacity(0.3),
                              blurRadius: 60,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/my_avatar.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppTheme.spaceGray,
                                child: const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.white38,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Name with gradient effect
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppTheme.neonBlue,
                            AppTheme.neonPurple,
                            AppTheme.neonPink,
                            AppTheme.neonPurple,
                            AppTheme.neonBlue,
                          ],
                          stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
                        ).createShader(bounds),
                        child: const Text(
                          'Muthunilavan D',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Role badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.neonBlue.withOpacity(0.25),
                              AppTheme.neonPurple.withOpacity(0.25),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: AppTheme.neonBlue.withOpacity(0.6),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.neonBlue.withOpacity(0.2),
                              blurRadius: 15,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Text(
                          'Flutter Developer | Creative Thinker | Problem Solver',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.neonBlue,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Tagline
                      Text(
                        'Building futuristic, real-world applications with\nclean architecture, elegant UI, and intelligent systems.',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.textSecondary,
                          height: 1.7,
                          letterSpacing: 0.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      // CTA Buttons
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          GlowButton(
                            text: 'View Projects',
                            icon: Icons.rocket_launch,
                            onPressed: () {
                              if (scrollController != null) {
                                scrollController!.animateTo(
                                  2000.0,
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                          GlowButton(
                            text: 'Download Resume',
                            icon: Icons.download,
                            isOutlined: true,
                            onPressed: _downloadResume,
                          ),
                          GlowButton(
                            text: 'Contact Me',
                            icon: Icons.mail,
                            isOutlined: true,
                            onPressed: () {
                              if (scrollController != null) {
                                scrollController!.animateTo(
                                  4400.0,
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left side - Avatar
                      Container(
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.neonBlue,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.neonBlue.withOpacity(0.6),
                              blurRadius: 40,
                              spreadRadius: 8,
                            ),
                            BoxShadow(
                              color: AppTheme.neonPurple.withOpacity(0.3),
                              blurRadius: 60,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/my_avatar.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppTheme.spaceGray,
                                child: const Icon(
                                  Icons.person,
                                  size: 100,
                                  color: Colors.white38,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 60),
                      // Right side - Content
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name with gradient effect
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: [
                                  Colors.white,
                                  AppTheme.neonBlue,
                                  Colors.white,
                                ],
                              ).createShader(bounds),
                              child: const Text(
                                'Muthunilavan D',
                                style: TextStyle(
                                  fontSize: 56,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            // Role badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppTheme.neonBlue.withOpacity(0.25),
                                    AppTheme.neonPurple.withOpacity(0.25),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                  color: AppTheme.neonBlue.withOpacity(0.6),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.neonBlue.withOpacity(0.2),
                                    blurRadius: 15,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Text(
                                'Flutter Developer | Creative Thinker | Problem Solver',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppTheme.neonBlue,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            // Tagline
                            Text(
                              'Building futuristic, real-world applications with\nclean architecture, elegant UI, and intelligent systems.',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppTheme.textSecondary,
                                height: 1.7,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 60),
                            // CTA Buttons
                            Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              alignment: WrapAlignment.start,
                              children: [
                                GlowButton(
                                  text: 'View Projects',
                                  icon: Icons.rocket_launch,
                                  onPressed: () {
                                    if (scrollController != null) {
                                      scrollController!.animateTo(
                                        2000.0,
                                        duration: const Duration(
                                          milliseconds: 800,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                ),
                                GlowButton(
                                  text: 'Download Resume',
                                  icon: Icons.download,
                                  isOutlined: true,
                                  onPressed: _downloadResume,
                                ),
                                GlowButton(
                                  text: 'Contact Me',
                                  icon: Icons.mail,
                                  isOutlined: true,
                                  onPressed: () {
                                    if (scrollController != null) {
                                      scrollController!.animateTo(
                                        4400.0,
                                        duration: const Duration(
                                          milliseconds: 800,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
