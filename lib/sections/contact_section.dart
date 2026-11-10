import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/glow_button.dart';
// Conditional import for web mailto handling
import '../mailto_helper_stub.dart'
    if (dart.library.html) '../mailto_helper_web.dart'
    as mailto_helper;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final subject = _subjectController.text.trim();
      final message = _messageController.text.trim();

      final emailBody = 'Name: $name\nEmail: $email\n\nMessage:\n$message';
      final emailSubject = Uri.encodeComponent(subject);
      final emailBodyEncoded = Uri.encodeComponent(emailBody);

      final mailtoUriString =
          'mailto:muthunilavand@gmail.com?subject=$emailSubject&body=$emailBodyEncoded';
      final mailtoUri = Uri.parse(mailtoUriString);

      try {
        bool launched = false;

        if (kIsWeb) {
          launched = await mailto_helper.launchMailtoWeb(mailtoUri.toString());

          if (launched) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opening your email client...'),
                  backgroundColor: AppTheme.surfaceElevated,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                ),
              );
            }
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                _nameController.clear();
                _emailController.clear();
                _subjectController.clear();
                _messageController.clear();
              }
            });
          } else {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Could not open email client. Please email muthunilavand@gmail.com directly.',
                  ),
                  backgroundColor: AppTheme.rose,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 4),
                ),
              );
            }
          }
        } else {
          if (await canLaunchUrl(mailtoUri)) {
            launched = await launchUrl(
              mailtoUri,
              mode: LaunchMode.externalApplication,
            );
          }

          if (launched) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opening your email client...'),
                  backgroundColor: AppTheme.surfaceElevated,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                ),
              );
            }
            _nameController.clear();
            _emailController.clear();
            _subjectController.clear();
            _messageController.clear();
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: $e'),
              backgroundColor: AppTheme.rose,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    }
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

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
                Column(
                  children: [
                    _buildContactInfo(),
                    const SizedBox(height: 20),
                    _buildFormCard(),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 4, child: _buildContactInfo()),
                    const SizedBox(width: 24),
                    Expanded(flex: 6, child: _buildFormCard()),
                  ],
                ),
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
            'COMMUNICATION',
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
          "Let's Build Something Impactful",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Open for software roles, internships, open source initiatives, and technical discussions.',
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      children: [
        _buildInfoCard(
          icon: Icons.email_outlined,
          title: 'Direct Email',
          value: 'muthunilavand@gmail.com',
          onTap: () => _launchURL('mailto:muthunilavand@gmail.com'),
        ),
        const SizedBox(height: 12),
        _buildInfoCard(
          icon: Icons.phone_outlined,
          title: 'Phone / WhatsApp',
          value: '+91 9047807547',
          onTap: () => _launchURL('tel:+919047807547'),
        ),
        const SizedBox(height: 12),
        _buildInfoCard(
          icon: Icons.location_on_outlined,
          title: 'Location',
          value: 'Madurai, Tamil Nadu, India',
          onTap: null,
        ),
        const SizedBox(height: 12),
        _buildInfoCard(
          icon: Icons.code,
          title: 'GitHub Profile',
          value: 'github.com/Muthunilavan-D',
          onTap: () => _launchURL('https://github.com/Muthunilavan-D'),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(18),
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.surfaceElevated,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppTheme.borderSubtle),
            ),
            child: Icon(icon, color: AppTheme.textPrimary, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14.5,
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (onTap != null)
            const Icon(
              Icons.arrow_outward,
              size: 15,
              color: AppTheme.textMuted,
            ),
        ],
      ),
    );
  }

  Widget _buildFormCard() {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(28),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Send a Direct Message',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "I'll get back to you promptly.",
              style: TextStyle(
                fontSize: 13.5,
                color: AppTheme.textMuted,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _nameController,
              label: 'Your Name',
              hint: 'John Doe',
              icon: Icons.person_outline,
              validator: (v) => v == null || v.isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 14),
            _buildTextField(
              controller: _emailController,
              label: 'Email Address',
              hint: 'john@example.com',
              icon: Icons.mail_outline,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Please enter your email';
                if (!v.contains('@')) return 'Please enter a valid email';
                return null;
              },
            ),
            const SizedBox(height: 14),
            _buildTextField(
              controller: _subjectController,
              label: 'Subject',
              hint: 'Opportunity / Project Collaboration',
              icon: Icons.chat_bubble_outline,
              validator: (v) => v == null || v.isEmpty ? 'Please enter a subject' : null,
            ),
            const SizedBox(height: 14),
            _buildTextField(
              controller: _messageController,
              label: 'Message',
              hint: 'Tell me about your project, idea, or role...',
              icon: Icons.edit_note,
              maxLines: 4,
              validator: (v) => v == null || v.isEmpty ? 'Please enter your message' : null,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: GlowButton(
                text: 'Send Message',
                icon: Icons.send_rounded,
                onPressed: _submitForm,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          style: const TextStyle(
            fontSize: 14,
            color: AppTheme.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 13.5,
              color: AppTheme.textMuted,
            ),
            prefixIcon: Icon(icon, size: 17, color: AppTheme.textMuted),
            filled: true,
            fillColor: AppTheme.surfaceElevated,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppTheme.borderSubtle),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppTheme.borderMedium, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppTheme.rose),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppTheme.rose, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
