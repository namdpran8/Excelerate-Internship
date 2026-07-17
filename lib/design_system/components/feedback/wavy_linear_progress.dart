import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../tokens/tokens.dart';

/// A linear progress indicator with a wavy/squiggly filled portion,
/// inspired by the Material 3 Expressive "wavy" progress bar.
///
/// Supports both determinate and indeterminate modes:
/// ```dart
/// // Indeterminate — wave travels continuously
/// WavyLinearProgressIndicator(value: null)
///
/// // Determinate — fills up to 35%, stops with a dot
/// WavyLinearProgressIndicator(value: 0.35)
/// ```
///
/// See also:
///   - [WavyCircularProgressIndicator] for circular variant.

class WavyLinearProgressIndicator extends StatefulWidget {
  /// Progress value between 0.0 and 1.0. Pass `null` for indeterminate mode.
  final double? value;

  /// Total height of the indicator widget.
  final double height;

  /// Vertical displacement of the wave peaks from the center line.
  final double waveAmplitude;

  /// Horizontal distance between wave peaks in logical pixels.
  final double waveLength;

  /// Thickness of the drawn wave and track lines.
  final double strokeWidth;

  /// Color of the active (filled) wave portion. Defaults to theme primary.
  final Color? activeColor;

  /// Color of the inactive (remaining) track portion. Defaults to theme surface container highest.
  final Color? inactiveColor;

  /// Accessible description announced by screen readers.
  final String? semanticsLabel;

  const WavyLinearProgressIndicator({
    super.key,
    this.value,
    this.height = ExSizes.iconMd,
    this.waveAmplitude = 4,
    this.waveLength = 18,
    this.strokeWidth = ExSizes.progressStrokeWidth,
    this.activeColor,
    this.inactiveColor,
    this.semanticsLabel,
  }) : assert(value == null || (value >= 0 && value <= 1)),
       assert(height > 0),
       assert(waveAmplitude >= 0),
       assert(waveLength > 0),
       assert(strokeWidth > 0),
       assert(height >= (waveAmplitude * 2) + strokeWidth);

  @override
  State<WavyLinearProgressIndicator> createState() =>
      _WavyLinearProgressIndicatorState();
}

class _WavyLinearProgressIndicatorState
    extends State<WavyLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: ExDurations.long);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateAnimation();
  }

  @override
  void didUpdateWidget(covariant WavyLinearProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _updateAnimation();
    }
  }

  void _updateAnimation() {
    final disableAnimations = MediaQuery.disableAnimationsOf(context);
    final isDeterminate = widget.value != null;
    if (disableAnimations || isDeterminate) {
      _controller.stop();
      if (isDeterminate) {
        _controller.value =
            0; // Reset phase for consistent determinate rendering
      }
    } else {
      if (!_controller.isAnimating) {
        _controller.repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = widget.value;
    return Semantics(
      label: widget.semanticsLabel ?? 'Progress indicator',
      value: value == null ? null : '${(value * 100).round()}%',
      liveRegion: value == null,
      child: ExcludeSemantics(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return CustomPaint(
              size: Size(double.infinity, widget.height),
              painter: _WavyLinearPainter(
                progress: value,
                phase: _controller.value * 2 * math.pi,
                amplitude: widget.waveAmplitude,
                waveLength: widget.waveLength,
                strokeWidth: widget.strokeWidth,
                activeColor:
                    widget.activeColor ?? Theme.of(context).colorScheme.primary,
                inactiveColor:
                    widget.inactiveColor ??
                    Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _WavyLinearPainter extends CustomPainter {
  final double? progress;
  final double phase;
  final double amplitude;
  final double waveLength;
  final double strokeWidth;
  final Color activeColor;
  final Color inactiveColor;

  _WavyLinearPainter({
    required this.progress,
    required this.phase,
    required this.amplitude,
    required this.waveLength,
    required this.strokeWidth,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final midY = size.height / 2;
    final activePaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final inactivePaint = Paint()
      ..color = inactiveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Determinate: wave up to `progress`, flat dot afterwards.
    // Indeterminate: wave travels across, no flat portion.
    final activeEndX = progress != null ? size.width * progress! : size.width;

    // --- Wavy active path ---
    final wavePath = Path();
    bool started = false;
    // Optimize: step by 3 pixels instead of 1 to reduce loop iterations
    for (double x = 0; x <= activeEndX; x += 3) {
      final y =
          midY + amplitude * math.sin((x / waveLength) * 2 * math.pi + phase);
      if (!started) {
        wavePath.moveTo(x, y);
        started = true;
      } else {
        wavePath.lineTo(x, y);
      }
    }
    canvas.drawPath(wavePath, activePaint);

    if (progress != null) {
      // --- Flat inactive track ---
      final trackStart = activeEndX + strokeWidth * 2;
      if (trackStart < size.width) {
        canvas.drawLine(
          Offset(trackStart, midY),
          Offset(size.width, midY),
          inactivePaint,
        );
      }
      // --- End dot ---
      canvas.drawCircle(
        Offset(activeEndX + strokeWidth * 1.2, midY),
        strokeWidth * 0.6,
        activePaint..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WavyLinearPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        phase != oldDelegate.phase ||
        amplitude != oldDelegate.amplitude ||
        waveLength != oldDelegate.waveLength ||
        strokeWidth != oldDelegate.strokeWidth ||
        activeColor != oldDelegate.activeColor ||
        inactiveColor != oldDelegate.inactiveColor;
  }
}
