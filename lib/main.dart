import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';

// Conditional import for web
import 'fullscreen_helper_stub.dart'
    if (dart.library.html) 'fullscreen_helper_web.dart' as fullscreen_helper;
import 'widgets/header_nav.dart';
import 'widgets/footer.dart';
import 'widgets/animated_background.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/experience_education_section.dart';
import 'sections/contact_section.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  // Add error handling
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kDebugMode) {
      print('Error: ${details.exception}');
      print('Stack: ${details.stack}');
    }
  };

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muthunilavan D - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  bool _isFullscreen = false;

  @override
  void initState() {
    super.initState();
    // Listen for fullscreen changes
    if (kIsWeb) {
      fullscreen_helper.initFullscreenListener((isFullscreen) {
        if (mounted) {
          setState(() {
            _isFullscreen = isFullscreen;
          });
        }
      });
      _isFullscreen = fullscreen_helper.isFullscreen;
    }
  }

  void _toggleFullscreen() {
    if (kIsWeb) {
      fullscreen_helper.toggleFullscreen();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Single shared background for entire page
          Positioned.fill(child: AnimatedBackground()),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(key: _heroKey, scrollController: _scrollController),
                AboutSection(key: _aboutKey),
                SkillsSection(key: _skillsKey),
                ProjectsSection(key: _projectsKey),
                ExperienceEducationSection(key: _experienceKey),
                ContactSection(key: _contactKey),
                const Footer(),
              ],
            ),
          ),
          // Always visible navigation bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderNav(
              scrollController: _scrollController,
              sectionKeys: {
                0: _heroKey,
                1: _aboutKey,
                2: _skillsKey,
                3: _projectsKey,
                4: _experienceKey,
                5: _contactKey,
              },
            ),
          ),
          // Fullscreen toggle button
          if (kIsWeb)
            Positioned(
              top: 80,
              right: 20,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _toggleFullscreen,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.spaceGray.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppTheme.neonBlue.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      _isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                      color: AppTheme.neonBlue,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
