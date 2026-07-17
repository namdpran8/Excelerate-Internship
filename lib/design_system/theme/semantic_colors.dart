import 'package:flutter/material.dart';

/// Semantic colors for Excelerate design system (success, warning, info, destructive).
class SemanticColors extends ThemeExtension<SemanticColors> {
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;

  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color onInfoContainer;

  final Color destructive;
  final Color onDestructive;
  final Color destructiveContainer;
  final Color onDestructiveContainer;

  const SemanticColors({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,
    required this.destructive,
    required this.onDestructive,
    required this.destructiveContainer,
    required this.onDestructiveContainer,
  });

  @override
  ThemeExtension<SemanticColors> copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? destructive,
    Color? onDestructive,
    Color? destructiveContainer,
    Color? onDestructiveContainer,
  }) {
    return SemanticColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      destructive: destructive ?? this.destructive,
      onDestructive: onDestructive ?? this.onDestructive,
      destructiveContainer: destructiveContainer ?? this.destructiveContainer,
      onDestructiveContainer: onDestructiveContainer ?? this.onDestructiveContainer,
    );
  }

  @override
  ThemeExtension<SemanticColors> lerp(covariant ThemeExtension<SemanticColors>? other, double t) {
    if (other is! SemanticColors) {
      return this;
    }
    return SemanticColors(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer: Color.lerp(successContainer, other.successContainer, t)!,
      onSuccessContainer: Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t)!,
      onWarningContainer: Color.lerp(onWarningContainer, other.onWarningContainer, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      onInfoContainer: Color.lerp(onInfoContainer, other.onInfoContainer, t)!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
      onDestructive: Color.lerp(onDestructive, other.onDestructive, t)!,
      destructiveContainer: Color.lerp(destructiveContainer, other.destructiveContainer, t)!,
      onDestructiveContainer: Color.lerp(onDestructiveContainer, other.onDestructiveContainer, t)!,
    );
  }

  /// Default light mode semantic colors.
  static const light = SemanticColors(
    success: Color(0xFF2E6C3A),
    onSuccess: Color(0xFFFFFFFF),
    successContainer: Color(0xFFB0F4B5),
    onSuccessContainer: Color(0xFF00210A),
    warning: Color(0xFF7A5900),
    onWarning: Color(0xFFFFFFFF),
    warningContainer: Color(0xFFFFDEA3),
    onWarningContainer: Color(0xFF261900),
    info: Color(0xFF0061A4),
    onInfo: Color(0xFFFFFFFF),
    infoContainer: Color(0xFFD1E4FF),
    onInfoContainer: Color(0xFF001D36),
    destructive: Color(0xFFBA1A1A),
    onDestructive: Color(0xFFFFFFFF),
    destructiveContainer: Color(0xFFFFDAD6),
    onDestructiveContainer: Color(0xFF410002),
  );

  /// Default dark mode semantic colors.
  static const dark = SemanticColors(
    success: Color(0xFF94D79B),
    onSuccess: Color(0xFF003913),
    successContainer: Color(0xFF135324),
    onSuccessContainer: Color(0xFFB0F4B5),
    warning: Color(0xFFF1C048),
    onWarning: Color(0xFF402D00),
    warningContainer: Color(0xFF5C4200),
    onWarningContainer: Color(0xFFFFDEA3),
    info: Color(0xFF9ECAFF),
    onInfo: Color(0xFF003258),
    infoContainer: Color(0xFF00497D),
    onInfoContainer: Color(0xFFD1E4FF),
    destructive: Color(0xFFFFB4AB),
    onDestructive: Color(0xFF690005),
    destructiveContainer: Color(0xFF93000A),
    onDestructiveContainer: Color(0xFFFFDAD6),
  );
}
