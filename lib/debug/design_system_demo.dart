library;

/// Living design system showcase — **debug only**.
///
/// This screen renders every component from the Excelerate design system
/// in a scrollable list. It acts as a catalog to verify visual changes
/// without needing to navigate the actual app.
///
/// This file should NOT be imported by production feature screens.
import 'package:flutter/material.dart';

import '../features/programs/widgets/program_card.dart';
import '../design_system/design_system.dart';

/// Debug-only design system showcase, launched by `main_design_system.dart`.
class LivingDesignSystemPage extends StatelessWidget {
  const LivingDesignSystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excelerate Demo'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Text(
            'Welcome',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'To the Excelerate Design',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),
          _buildTokensSection(context),
          const SizedBox(height: 32),
          _buildTypographySection(context),
          const SizedBox(height: 32),
          _buildButtonsSection(context),
          const SizedBox(height: 32),
          _buildInputsSection(context),
          const SizedBox(height: 32),
          _buildCardsSection(context),
          const SizedBox(height: 32),
          _buildFeedbackSection(context),
          const SizedBox(height: 32),
          _buildMiscSection(context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildDocNote(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 12,
          fontFamily: 'monospace',
        ),
      ),
    );
  }

  Widget _buildTokensSection(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Color Tokens', context),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _ColorSwatch(
              name: 'Primary',
              color: colors.primary,
              hex: '#8F4C43',
            ),
            _ColorSwatch(
              name: 'Primary Container',
              color: colors.primaryContainer,
              hex: '#FFDAD5',
            ),
            _ColorSwatch(
              name: 'Secondary',
              color: colors.secondary,
              hex: '#3D6835',
            ),
            _ColorSwatch(
              name: 'Surface',
              color: colors.surface,
              hex: '#FFF8F6',
            ),
            _ColorSwatch(
              name: 'Surface Container Highest',
              color: colors.surfaceContainerHighest,
              hex: '#EEDFDD',
            ),
            _ColorSwatch(name: 'Error', color: colors.error, hex: '#BA1A1A'),
          ],
        ),
      ],
    );
  }

  Widget _buildTypographySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Typography', context),
        Text('Display Large', style: Theme.of(context).textTheme.displayLarge),
        _buildDocNote('Dancing Script, 57px, w700', context),
        Text(
          'Headline Large',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        _buildDocNote('Be Vietnam Pro, 32px, w600', context),
        Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
        _buildDocNote('Inter, 16px, w400', context),
      ],
    );
  }

  Widget _buildButtonsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Buttons', context),
        ExPrimaryButton(onPressed: () {}, child: const Text('Primary Default')),
        _buildDocNote('ExPrimaryButton', context),
        ExPrimaryButton(onPressed: null, child: const Text('Primary Disabled')),
        _buildDocNote('ExPrimaryButton (onPressed: null)', context),
        ExSecondaryButton(
          onPressed: () {},
          child: const Text('Secondary Default'),
        ),
        _buildDocNote('ExSecondaryButton', context),
      ],
    );
  }

  Widget _buildInputsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Inputs', context),
        const ExTextField(
          labelText: 'Email',
          hintText: 'Enter your email',
          prefixIcon: Icon(Icons.email),
        ),
        _buildDocNote('ExTextField\nfloating label & prefixIcon', context),
        const ExSearchBar(hintText: 'Search programs...'),
        _buildDocNote('ExSearchBar\nPill-shaped, filled', context),
      ],
    );
  }

  Widget _buildCardsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Cards', context),
        ExCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ExCard', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'Generic card surface styled by CardTheme.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        _buildDocNote('ExCard', context),
        ProgramCard(
          title: 'Advanced UI/UX',
          description: 'Master Figma and design systems.',
          imageUrl: '',
          onTap: () {},
        ),
        _buildDocNote('ProgramCard\nUses ExCard base', context),
      ],
    );
  }

  Widget _buildFeedbackSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Feedback & Interaction', context),
        Wrap(
          spacing: 16,
          children: [
            ExPrimaryButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a Snackbar!')),
                );
              },
              child: const Text('Show Snackbar'),
            ),
            ExSecondaryButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Dialog Title'),
                    content: const Text('This is the content of the dialog.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Show Dialog'),
            ),
          ],
        ),
        _buildDocNote(
          'Standard Material Feedback components using the Theme',
          context,
        ),
        WavyCircularProgressIndicator(
          value: null,
          size: 56,
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        _buildDocNote(
          'WavyCircularProgressIndicator (Custom Indeterminate)',
          context,
        ),
        const SizedBox(height: 32),
        WavyCircularProgressIndicator(
          value: 0.65,
          size: 56,
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        _buildDocNote(
          'WavyCircularProgressIndicator (Custom Determinate)',
          context,
        ),
        const SizedBox(height: 32),
        WavyLinearProgressIndicator(
          value: null,
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        _buildDocNote(
          'WavyLinearProgressIndicator (Custom Indeterminate)',
          context,
        ),
        const SizedBox(height: 32),
        WavyLinearProgressIndicator(
          value: 0.35,
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        _buildDocNote(
          'WavyLinearProgressIndicator (Custom Determinate)',
          context,
        ),
      ],
    );
  }

  Widget _buildMiscSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Misc Components', context),
        const ExSectionHeader(title: 'My Programs', onTrailingPressed: null),
        _buildDocNote('ExSectionHeader', context),
        const ExAvatar(initials: 'PK'),
        _buildDocNote('ExAvatar', context),
        Wrap(
          spacing: 8,
          children: [
            ExFilterChip(
              label: 'Selected',
              isSelected: true,
              onSelected: (v) {},
            ),
            ExFilterChip(
              label: 'Unselected',
              isSelected: false,
              onSelected: (v) {},
            ),
          ],
        ),
        _buildDocNote('ExFilterChip', context),
        const EmptyState(message: 'No programs found.', icon: Icons.school),
        _buildDocNote('EmptyState', context),
      ],
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final String name;
  final Color color;
  final String hex;

  const _ColorSwatch({
    required this.name,
    required this.color,
    required this.hex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          hex,
          style: TextStyle(
            fontSize: 10,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
