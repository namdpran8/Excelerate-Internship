# Excelerate Living Design System

Welcome to the Excelerate Living Design System! This document serves as a guide for all team members (especially for UI/UX integration and global theme wiring) to understand how to use the pre-built, reusable components to build screens rapidly and consistently.

## Getting Started

Instead of importing individual files for every widget, simply add this **single import** to the top of your Dart files:

```dart
import 'package:excelerate_internship/design_system.dart';
// Note: adjust the package name if your pubspec name differs, 
// or use relative paths like import '../../design_system.dart';
```

---

## The Global Theme

The design system handles Material 3 Expression and Motion automatically. The central theme configuration is located in `lib/constants/theme.dart`.

To ensure all components look correct, `main.dart` should wrap the app like this:
```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.system, 
  scrollBehavior: const MaterialScrollBehavior(), // Ensures M3 physics
  home: ...
)
```

**Typography:** You do not need to manually style fonts. Use the standard text styles:
```dart
Text('My Title', style: Theme.of(context).textTheme.titleLarge);
Text('My Body text', style: Theme.of(context).textTheme.bodyMedium);
```

---

## Component Library

### 1. Buttons

The buttons already implement `FilledButton` and `OutlinedButton` under the hood with proper M3 shapes (8px radius) and paddings.

**Primary Button** (Filled, high emphasis)
```dart
PrimaryButton(
  text: 'Get Started',
  onPressed: () {
    // action
  },
)
```

**Secondary Button** (Outlined, medium emphasis)
```dart
SecondaryButton(
  text: 'Cancel',
  onPressed: () {
    // action
  },
)
```

---

### 2. Cards & Containers

**Expressive Card**
A base card that provides the default surface colors and an implicit `InkWell` for native M3 ripple effects when tapped.
```dart
ExpressiveCard(
  onTap: () {
    print('Card Tapped!'); // Triggers a ripple
  },
  padding: const EdgeInsets.all(16.0),
  child: Text('Card Content'),
)
```

**Program Card**
A specialized composite card built on top of `ExpressiveCard`. Used to display courses, internships, or programs.
```dart
ProgramCard(
  title: 'Flutter Internship',
  description: 'Learn Flutter by building real world apps.',
  imageUrl: 'path/to/image.png',
  onTap: () => print('Open Program'),
)
```

---

### 3. Inputs & Forms

**Custom Text Field**
A styled `TextFormField` with smooth borders and filled backgrounds.
```dart
CustomTextField(
  hintText: 'Enter your email',
  prefixIcon: Icons.email,
  obscureText: false,
)
```

**Custom Search Bar**
A specialized input specifically optimized for searching lists/content.
```dart
CustomSearchBar(
  hintText: 'Search programs...',
  onChanged: (value) {
    // filter logic
  },
)
```

---

### 4. Progress & Feedback (Wavy Indicators)

We feature stunning, organic "wavy" progress indicators heavily inspired by Material 3 Expressive guidelines.

**Wavy Circular Progress Indicator**
```dart
// Indeterminate (spinning continuously)
WavyCircularProgressIndicator(value: null)

// Determinate (fixed at 65%)
WavyCircularProgressIndicator(value: 0.65)
```

**Wavy Linear Progress Indicator**
```dart
// Indeterminate (wave travels across the line)
WavyLinearProgressIndicator(value: null)

// Determinate (fills up to 35%, stops with a dot)
WavyLinearProgressIndicator(value: 0.35)
```

*Note: The original package versions (`ExpressiveLoadingIndicator` and `ExpressiveLinearProgressIndicator`) are also available if you prefer the morphing shape styles.*

---

### 5. Layout & Misc

**Section Header**
A clean row with a Title on the left and a "See All" button on the right.
```dart
SectionHeader(
  title: 'Recommended Programs',
  onSeeAll: () {
    // navigate to list
  },
)
```

**Custom Chip**
A styled `FilterChip` for tags, categories, or filters. Includes implicit animations.
```dart
CustomChip(
  label: 'Design',
  isSelected: true,
  onSelected: (selected) {
    // toggle state
  },
)
```

**Custom Avatar**
A unified profile picture widget that handles fallbacks gracefully.
```dart
CustomAvatar(
  imageUrl: 'https://...', // optional
  radius: 24,
)
```

**Empty State**
Use this when a list is empty or a search returns no results.
```dart
EmptyState(
  icon: Icons.search_off,
  title: 'No results found',
  message: 'Try adjusting your filters.',
)
```

---

## Best Practices
- **Do not hardcode colors**. Always rely on `Theme.of(context).colorScheme...` if you need a specific color. Our `AppTheme` handles the dark/light mode mapping for you.
- **Do not hardcode font families**. Use `Theme.of(context).textTheme`.
- **Use the Barrel File**. Always import `design_system.dart` rather than pathing to individual files in `lib/widgets/...`. It keeps imports clean and avoids cyclic dependencies.
