import 'package:flutter/material.dart';

import '../design_system/design_system.dart';

class ProgramDetailsScreen extends StatelessWidget {
  const ProgramDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ExScaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Program Details',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(ExSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            ClipRRect(
              borderRadius: ExRadii.borderRadiusLg,
              child: Image.network(
                'https://picsum.photos/seed/architecture/800/400',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: ExSpacing.md),

            // Trending Tag
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: ExSpacing.sm,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: ExRadii.borderRadiusFull,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_fire_department_outlined,
                    size: 16,
                    color: Colors.green.shade800,
                  ),
                  const SizedBox(width: ExSpacing.xs),
                  Text(
                    'TRENDING COURSE',
                    style: textTheme.labelSmall?.copyWith(
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ExSpacing.sm),

            // Title
            Text(
              'Advanced Sustainable\nArchitecture',
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            const SizedBox(height: ExSpacing.md),

            // Description
            Text(
              'Dive deep into the principles of eco-friendly building '
              'design. This comprehensive program covers modern '
              'materials, energy-efficient structures, and integrating '
              'natural environments into urban planning. Perfect for '
              'professionals looking to elevate their architectural '
              'practice with sustainable methodologies.',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: ExSpacing.lg),

            // Details Card
            ExCard(
              child: Column(
                children: [
                  _buildDetailRow(
                    context,
                    icon: Icons.access_time,
                    title: 'Duration',
                    subtitle: '12 Weeks (4 hours/week)',
                  ),
                  const Divider(height: ExSpacing.lg),
                  _buildDetailRow(
                    context,
                    icon: Icons.workspace_premium_outlined,
                    title: 'Certification',
                    subtitle: 'Industry Recognized Certificate',
                  ),
                  const Divider(height: ExSpacing.lg),
                  _buildDetailRow(
                    context,
                    icon: Icons.people_outline,
                    title: 'Cohort Size',
                    subtitle: 'Limited to 25 students',
                  ),
                ],
              ),
            ),
            const SizedBox(height: ExSpacing.xl),

            // Instructor Section
            Text(
              'Instructor',
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: ExSpacing.md),
            Row(
              children: [
                const ExAvatar(
                  initials: 'PN',
                  radius: 28,
                ),
                const SizedBox(width: ExSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pranshu Namdeo',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Lead Architect, EcoBuild Inc.',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: ExSpacing.xxl),

            // Feedback Section
            Text(
              'Student Feedback',
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: ExSpacing.md),
            ExCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star_half, color: Colors.amber, size: 20),
                      const SizedBox(width: ExSpacing.sm),
                      Text(
                        '4.8/5',
                        style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: ExSpacing.sm),
                  Text(
                    '"This program completely changed the way I look at building design. The concepts are very practical and easy to apply!"',
                    style: textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: ExSpacing.md),
                  Text(
                    '- Alex Johnson, Architect',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ExSpacing.xxl),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ExSpacing.md,
              vertical: ExSpacing.md,
            ),
            child: Column(
              children: [
                ExPrimaryButton(
                  onPressed: () {},
                  child: const Text('Enroll Now'),
                ),
                const SizedBox(height: ExSpacing.sm),
                ExSecondaryButton(
                  onPressed: () {},
                  child: const Text('Leave Feedback'),
                ),
              ],
            ),
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 1, // "Programs" selected
            selectedItemColor: colorScheme.primary,
            unselectedItemColor: colorScheme.onSurfaceVariant,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school), // Selected is solid usually, or just use outlined everywhere
                label: 'Programs',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: colorScheme.onSurfaceVariant, size: 24),
        const SizedBox(width: ExSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
