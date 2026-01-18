import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      decoration: BoxDecoration(
        color: AppTheme.deepSpace,
        border: Border(
          top: BorderSide(
            color: AppTheme.neonBlue.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.code, size: 32),
                color: AppTheme.neonBlue,
                onPressed: () => _launchURL('https://github.com/Muthunilavan-D'),
                tooltip: 'GitHub',
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.work, size: 32),
                color: AppTheme.neonPurple,
                onPressed: () => _launchURL('https://www.linkedin.com/in/d-mn-92a1b7341'),
                tooltip: 'LinkedIn',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '© 2026 Muthunilavan D',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Built with ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white60,
                ),
              ),
              Icon(
                Icons.favorite,
                size: 16,
                color: AppTheme.neonPink,
              ),
              Text(
                ' using Flutter Web',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Designed with a futuristic space-inspired dark neon theme',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white38,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
