# Excelerate Design System

The Excelerate Design System provides a standardized, cohesive set of UI components and styling tokens built on top of Material 3. This guide serves as the definitive source of truth for using the design system.

## Core Philosophy

1. **Material 3 Foundation:** We build on top of Flutter's Material 3 implementation, utilizing `AppTheme` and `ColorScheme` extensively.
2. **Tokens, not Constants:** Never hardcode colors, padding, radii, or typography in UI components. Always use the predefined tokens or theme extensions.
3. **Responsive by Default:** Use layout primitives that naturally adapt to various screen sizes.
4. **Single Source of Truth:** `lib/design_system/design_system.dart` is the only file you should import when accessing design system elements.

## Token Architecture

Our tokens abstract raw values into semantic meanings:

- **Colors (`ExColorScheme`, `SemanticColors`):** Provide the full 30-color M3 palette and custom semantic statuses (Success, Warning, Info, Destructive). Access via `Theme.of(context).colorScheme` and `Theme.of(context).extension<SemanticColors>()`.
- **Typography (`ExTypography`):** Implements all 15 M3 text roles (Display, Headline, Title, Body, Label) with explicit letter spacing and line heights. Access via `Theme.of(context).textTheme`.
- **Spacing (`ExSpacing`):** Base-4 and base-8 spacing values (xs: 4, sm: 8, md: 16, lg: 24, xl: 32, xxl: 48).
- **Radii (`ExRadii`):** Standardized border radii (xs: 4, sm: 8, md: 12, lg: 16, xl: 28, full: 9999).
- **Elevations (`ExElevations`):** 4 levels of surface elevation based on the M3 tonal system (0.0, 1.0, 3.0, 6.0).
- **Sizes (`ExSizes`):** Standard sizes for icons, avatars, and buttons.
- **Durations (`ExDurations`):** Consistent motion timings for animations.

## Components

### Buttons
- **`ExPrimaryButton`:** High-emphasis actions.
- **`ExSecondaryButton`:** Medium-emphasis outlined actions.
- Both natively handle `Future`-returning `onPressed` callbacks by automatically showing a loading state and preventing duplicate taps.

### Inputs
- **`ExTextField`:** Form-capable styled input field. Inherits heavily from the standard `InputDecorationTheme`. (Wraps `TextFormField`).
- **`ExSearchBar`:** Wraps the M3 `SearchBar` for a stadium-shaped, search-optimized input.

### Layout & Containers
- **`ExScaffold`:** A responsive scaffold that automatically restricts content width on large screens to prevent stretching.
- **`ExSectionHeader`:** Introduces content sections with an optional trailing action (e.g., "See All").
- **`ExCard`:** A purely visual generic surface container with default margin, padding, elevation, and shape.
- **`ExAvatar`:** User profile representations.
- **`ExFilterChip`:** Selectable category filters.

### Feedback
- **`EmptyState`:** A full-screen placeholder when content is unavailable.
- **`WavyCircularProgressIndicator` & `WavyLinearProgressIndicator`:** Expressive loading indicators supporting both determinate and indeterminate modes. They automatically pause when animations are disabled by the OS.

## Best Practices

- **Avoid Wrappers:** Do not create wrappers for simple widgets like `Divider`, `Dialog`, or `Snackbar`. Theme them globally in `AppTheme`.
- **Feature Specificity:** Components like `ProgramCard` belong in their respective feature folders (`lib/features/programs/widgets/`), not the core design system.
- **Accessibility:** All custom components must support `Semantics` and respect `MediaQuery.disableAnimations`.

## Demo & Showcase

Run the isolated design system gallery to test components without running the full app:
```bash
flutter run -t lib/main_design_system.dart
```
