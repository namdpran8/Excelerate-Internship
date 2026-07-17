/// Excelerate Design System — Public API
///
/// Import this single file to access all design tokens, theme configuration,
/// and reusable components in the Excelerate design system.
///
/// ```dart
/// import 'package:excelerate_internship/design_system/design_system.dart';
/// ```
///
/// This barrel file re-exports the full public surface area:
/// - **Theme**: [AppTheme] with light and dark [ThemeData]
/// - **Components**: Buttons, cards, inputs, feedback widgets, layout helpers
library;

// ──────────────────────────────────────────────────────────────────────────────
// Tokens — pure constants (spacing, radii, durations, elevations)
// ──────────────────────────────────────────────────────────────────────────────
export 'tokens/tokens.dart';

// ──────────────────────────────────────────────────────────────────────────────
// Theme — color schemes, typography, assembled ThemeData
// ──────────────────────────────────────────────────────────────────────────────
export 'theme/app_theme.dart';
export 'theme/ex_color_scheme.dart';
export 'theme/ex_typography.dart';

// ──────────────────────────────────────────────────────────────────────────────
// Components
// ──────────────────────────────────────────────────────────────────────────────
export '../widgets/custom_avatar.dart';
export '../widgets/custom_chip.dart';
export '../widgets/custom_search_bar.dart';
export '../widgets/custom_text_field.dart';
export '../widgets/empty_state.dart';
export '../widgets/expressive_card.dart';
export '../widgets/primary_button.dart';
export '../widgets/program_card.dart';
export '../widgets/secondary_button.dart';
export '../widgets/section_header.dart';
export '../widgets/wavy_progress_indicators.dart';
