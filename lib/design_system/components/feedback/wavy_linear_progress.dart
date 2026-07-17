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
import 'dart:math' as math;
import 'package:flutter/material.dart';

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

  /// Color of the active (filled) wave portion.
  final Color activeColor;

  /// Color of the inactive (remaining) track portion.
  final Color inactiveColor;

  const WavyLinearProgressIndicator({
    super.key,
    this.value,
    this.height = 24,
    this.waveAmplitude = 4,
    this.waveLength = 18,
    this.strokeWidth = 4,
    this.activeColor = Colors.deepPurple,
    this.inactiveColor = const Color(0xFFE3DEF7),
  });

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
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          size: Size(double.infinity, widget.height),
          painter: _WavyLinearPainter(
            progress: widget.value,
            phase: _controller.value * 2 * math.pi,
            amplitude: widget.waveAmplitude,
            waveLength: widget.waveLength,
            strokeWidth: widget.strokeWidth,
            activeColor: widget.activeColor,
            inactiveColor: widget.inactiveColor,
          ),
        );
      },
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
      final y = midY + amplitude * math.sin((x / waveLength) * 2 * math.pi + phase);
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
  bool shouldRepaint(covariant _WavyLinearPainter oldDelegate) => true;
}
