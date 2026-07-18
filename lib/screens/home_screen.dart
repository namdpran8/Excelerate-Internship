import 'package:flutter/material.dart';
import 'section_header.dart';

/// Excelerate color theme (sampled from the wireframes)
class AppColors {
  static const maroon = Color(0xFF8B1E2D);
  static const maroonDark = Color(0xFF6E1622);
  static const cream = Color(0xFFFBF3E7);
  static const card = Color(0xFFFFFFFF);
  static const textDark = Color(0xFF241412);
  static const textGrey = Color(0xFF7A7270);
  static const chipBg = Color(0xFFF3E3D3);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: const [
            Icon(Icons.school, color: AppColors.maroon, size: 26),
            SizedBox(width: 8),
            Text(
              'Excelerate',
              style: TextStyle(
                color: AppColors.maroon,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.chipBg,
            child: const Icon(Icons.person, color: AppColors.maroon, size: 20),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "You're making great progress.",
                style: TextStyle(fontSize: 13, color: AppColors.textGrey),
              ),
              const SizedBox(height: 24),

              // ---------------- Programs ----------------
              const SectionHeader(title: 'Programs'),
              _ProgramsCard(
                onTap: () => Navigator.pushNamed(context, '/programs'),
              ),
              const SizedBox(height: 28),

              // ---------------- Announcements ----------------
              const SectionHeader(title: 'Announcements'),
              const _AnnouncementCard(
                title: 'New Cohort Starting Aug 1st',
                body:
                    'Enrollment for the Applied Machine Learning program '
                    'closes this Friday. Secure your seat today!',
                tag: 'Deadline',
              ),
              const SizedBox(height: 28),

              // ---------------- Quick Links ----------------
              const SectionHeader(title: 'Quick Links'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _QuickLinkButton(
                    icon: Icons.person_outline,
                    label: 'Profile',
                    onTap: () => Navigator.pushNamed(context, '/profile'),
                  ),
                  _QuickLinkButton(
                    icon: Icons.feedback_outlined,
                    label: 'Feedback',
                    onTap: () => Navigator.pushNamed(context, '/feedback'),
                  ),
                  _QuickLinkButton(
                    icon: Icons.settings_outlined,
                    label: 'Settings',
                    onTap: () => Navigator.pushNamed(context, '/settings'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

/// Card/button linking into the Program Listing screen.
class _ProgramsCard extends StatelessWidget {
  final VoidCallback onTap;
  const _ProgramsCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.maroon,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.maroonDark.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.menu_book_rounded,
                  color: Colors.white, size: 26),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Browse Programs',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Explore courses across Design, Engineering & Business',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }
}

/// Sample announcement card.
class _AnnouncementCard extends StatelessWidget {
  final String title;
  final String body;
  final String tag;

  const _AnnouncementCard({
    required this.title,
    required this.body,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.chipBg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.chipBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.maroon,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(Icons.campaign_outlined,
                  color: AppColors.maroon, size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            body,
            style: const TextStyle(fontSize: 13, color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }
}

/// A single icon + label quick-link button.
class _QuickLinkButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickLinkButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.chipBg),
            ),
            child: Icon(icon, color: AppColors.maroon, size: 24),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.textDark),
          ),
        ],
      ),
    );
  }
}
