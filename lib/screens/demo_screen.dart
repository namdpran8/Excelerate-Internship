import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:material3_expressive_loading_indicator/material3_expressive_loading_indicator.dart';
import '../design_system.dart'; // Unified global design system import

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
          Text('Welcome', style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          )),
          const SizedBox(height: 8),
          Text('To the Excelerate Design System', style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          )),
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
        Text(title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildDocNote(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
      child: Text(text, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12, fontFamily: 'monospace')),
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
            _ColorSwatch(name: 'Primary', color: colors.primary, hex: '#FFDAD5'),
            _ColorSwatch(name: 'Primary Container', color: colors.primaryContainer, hex: '#FFB4A9'),
            _ColorSwatch(name: 'Secondary', color: colors.secondary, hex: '#A5D299'),
            _ColorSwatch(name: 'Surface', color: colors.surface, hex: '#141310'),
            _ColorSwatch(name: 'Surface Variant', color: colors.flutter testsurfaceVariant, hex: '#363530'),
            _ColorSwatch(name: 'Error', color: colors.error, hex: '#FFB4AB'),
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
        _buildDocNote('Be Vietnam Pro, 57px, w700', context),
        Text('Headline Large', style: Theme.of(context).textTheme.headlineLarge),
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
        PrimaryButton(onPressed: () {}, child: const Text('Primary Default')),
        _buildDocNote('PrimaryButton\nHeight: 52\nRadius: 8', context),
        PrimaryButton(onPressed: null, child: const Text('Primary Disabled')),
        _buildDocNote('PrimaryButton (onPressed: null)', context),
        SecondaryButton(onPressed: () {}, child: const Text('Secondary Default')),
        _buildDocNote('SecondaryButton\nHeight: 52\nRadius: 8', context),
      ],
    );
  }

  Widget _buildInputsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Inputs', context),
        const CustomTextField(
          labelText: 'Email',
          hintText: 'Enter your email',
          prefixIcon: Icon(Icons.email),
        ),
        _buildDocNote('CustomTextField\nfloating label & prefixIcon', context),
        const CustomSearchBar(hintText: 'Search programs...'),
        _buildDocNote('CustomSearchBar\nPill-shaped, filled', context),
      ],
    );
  }

  Widget _buildCardsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Cards', context),
        ExpressiveCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Expressive Card', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Base card container with 16px radius.', style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
            ],
          ),
        ),
        _buildDocNote('ExpressiveCard\nPadding: 24\nRadius: 16', context),
        ProgramCard(
          title: 'Advanced UI/UX',
          description: 'Master Figma and design systems.',
          imageUrl: '',
          onTap: () {},
        ),
        _buildDocNote('ProgramCard\nUses ExpressiveCard base', context),
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
            PrimaryButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a Snackbar!')));
              },
              child: const Text('Show Snackbar'),
            ),
            SecondaryButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Dialog Title'),
                    content: const Text('This is the content of the dialog.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
                    ],
                  ),
                );
              },
              child: const Text('Show Dialog'),
            ),
          ],
        ),
        _buildDocNote('Standard Material Feedback components using the Theme', context),
        const ExpressiveLoadingIndicator(),
        _buildDocNote('ExpressiveLoadingIndicator (Material 3 Morphing Circular)', context),
        const SizedBox(height: 32),
        ExpressiveLinearProgressIndicator(
          value: 0.5,
          minHeight: 32.0, 
        ),
        _buildDocNote('ExpressiveLinearProgressIndicator (Material 3 Wavy)', context),
        const SizedBox(height: 32),
        WavyCircularProgressIndicator(
          value: null, 
          size: 56,
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        _buildDocNote('WavyCircularProgressIndicator (Custom Indeterminate)', context),
        const SizedBox(height: 32),
        WavyCircularProgressIndicator(
          value: 0.65, 
          size: 56,
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        _buildDocNote('WavyCircularProgressIndicator (Custom Determinate)', context),
        const SizedBox(height: 32),
        WavyLinearProgressIndicator(
          value: null,
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        _buildDocNote('WavyLinearProgressIndicator (Custom Indeterminate)', context),
        const SizedBox(height: 32),
        WavyLinearProgressIndicator(
          value: 0.35,
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        _buildDocNote('WavyLinearProgressIndicator (Custom Determinate)', context),
      ],
    );
  }

  Widget _buildMiscSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Misc Components', context),
        const SectionHeader(title: 'My Programs', onSeeAll: null),
        _buildDocNote('SectionHeader', context),
        const CustomAvatar(initials: 'PK'),
        _buildDocNote('CustomAvatar', context),
        Wrap(
          spacing: 8,
          children: [
            CustomChip(label: 'Selected', isSelected: true, onSelected: (v) {}),
            CustomChip(label: 'Unselected', isSelected: false, onSelected: (v) {}),
          ],
        ),
        _buildDocNote('CustomChip\nPadding: 12x8', context),
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

  const _ColorSwatch({required this.name, required this.color, required this.hex});

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
            border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
          ),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        Text(hex, style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onSurfaceVariant)),
      ],
    );
  }
}
