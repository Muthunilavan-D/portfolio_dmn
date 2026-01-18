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

      // Create mailto link with pre-filled information
      final emailBody = 'Name: $name\nEmail: $email\n\nMessage:\n$message';
      final emailSubject = Uri.encodeComponent(subject);
      final emailBodyEncoded = Uri.encodeComponent(emailBody);

      // Construct mailto URI properly
      final mailtoUriString =
          'mailto:muthunilavand@gmail.com?subject=$emailSubject&body=$emailBodyEncoded';
      final mailtoUri = Uri.parse(mailtoUriString);

      try {
        bool launched = false;

        if (kIsWeb) {
          // For web, use HTML anchor element approach
          // This is the most reliable method for web browsers
          launched = await mailto_helper.launchMailtoWeb(mailtoUri.toString());

          if (launched) {
            // Show success message only if launch was successful
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Opening your email client...'),
                  backgroundColor: AppTheme.neonBlue,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                ),
              );
            }
            // Clear form after a short delay
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                _nameController.clear();
                _emailController.clear();
                _subjectController.clear();
                _messageController.clear();
              }
            });
          } else {
            // If launch failed, show error message
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    'Could not open email client. Please send email manually to muthunilavand@gmail.com',
                  ),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 4),
                ),
              );
            }
          }
        } else {
          // For mobile/desktop, check if we can launch first
          if (await canLaunchUrl(mailtoUri)) {
            launched = await launchUrl(
              mailtoUri,
              mode: LaunchMode.externalApplication,
            );
          }

          if (launched) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Opening your email client...'),
                  backgroundColor: AppTheme.neonBlue,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                ),
              );
            }
            // Clear form after a short delay
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
                SnackBar(
                  content: const Text(
                    'Could not open email client. Please send email manually to muthunilavand@gmail.com',
                  ),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 4),
                ),
              );
            }
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error: $e. Please send email manually to muthunilavand@gmail.com',
              ),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 4),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 768 ? 40 : 20,
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
                  'CONTACT',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width > 768 ? 36 : 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.neonBlue,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Let\'s Build Something Amazing',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width > 768 ? 26 : 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Feel free to reach out for internships, collaborations, freelance projects, or tech discussions.',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width > 768 ? 16 : 14,
                    color: AppTheme.textSecondary,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
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
                          child: Column(
                            children: [
                              _ContactInfoCard(
                                icon: Icons.email,
                                title: 'Email',
                                value: 'muthunilavand@gmail.com',
                                color: AppTheme.neonBlue,
                              ),
                              const SizedBox(height: 16),
                              _ContactInfoCard(
                                icon: Icons.location_on,
                                title: 'Location',
                                value: 'Madurai,Tamil Nadu, India',
                                color: AppTheme.neonPurple,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          flex: 2,
                          child: GlassCard(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _ContactTextField(
                                    controller: _nameController,
                                    label: 'Name',
                                    icon: Icons.person,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  _ContactTextField(
                                    controller: _emailController,
                                    label: 'Your Email',
                                    icon: Icons.email,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      if (!value.contains('@') ||
                                          !value.contains('.')) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  _ContactTextField(
                                    controller: _subjectController,
                                    label: 'Subject',
                                    icon: Icons.subject,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a subject';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  _ContactTextField(
                                    controller: _messageController,
                                    label: 'Message',
                                    icon: Icons.message,
                                    maxLines: 6,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your message';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  GlowButton(
                                    text: 'Send Message',
                                    icon: Icons.send,
                                    onPressed: _submitForm,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _ContactInfoCard(
                          icon: Icons.email,
                          title: 'Email',
                          value: 'muthunilavand@gmail.com',
                          color: AppTheme.neonBlue,
                        ),
                        const SizedBox(height: 16),
                        _ContactInfoCard(
                          icon: Icons.location_on,
                          title: 'Location',
                          value: 'Chennai, India',
                          color: AppTheme.neonPurple,
                        ),
                        const SizedBox(height: 24),
                        GlassCard(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _ContactTextField(
                                  controller: _nameController,
                                  label: 'Name',
                                  icon: Icons.person,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                _ContactTextField(
                                  controller: _emailController,
                                  label: 'Your Email',
                                  icon: Icons.email,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!value.contains('@') ||
                                        !value.contains('.')) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                _ContactTextField(
                                  controller: _subjectController,
                                  label: 'Subject',
                                  icon: Icons.subject,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a subject';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                _ContactTextField(
                                  controller: _messageController,
                                  label: 'Message',
                                  icon: Icons.message,
                                  maxLines: 6,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your message';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 30),
                                GlowButton(
                                  text: 'Send Message',
                                  icon: Icons.send,
                                  onPressed: _submitForm,
                                ),
                              ],
                            ),
                          ),
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

class _ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _ContactInfoCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color.withOpacity(0.5), width: 1),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    color: color.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _ContactTextField({
    required this.controller,
    required this.label,
    required this.icon,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppTheme.neonBlue),
        labelStyle: TextStyle(color: AppTheme.textSecondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppTheme.neonBlue.withOpacity(0.3),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.neonBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: AppTheme.spaceGray.withOpacity(0.5),
      ),
    );
  }
}
