/// A circular progress indicator with a wavy/squiggly stroke,
/// inspired by the Material 3 Expressive circular loader style.
///
/// Supports both determinate and indeterminate modes:
/// ```dart
/// // Indeterminate — spinning continuously
/// WavyCircularProgressIndicator(value: null)
///
/// // Determinate — fixed at 65%
/// WavyCircularProgressIndicator(value: 0.65)
/// ```
///
/// See also:
///   - [WavyLinearProgressIndicator] for linear variant.
import 'dart:math' as math;
import 'package:flutter/material.dart';

class WavyCircularProgressIndicator extends StatefulWidget {
  /// Progress value between 0.0 and 1.0. Pass `null` for indeterminate mode.
  final double? value;

  /// Diameter of the indicator in logical pixels.
  final double size;

  /// Radial displacement of the wave bumps from the base circle.
  final double waveAmplitude;

  /// Number of wave bumps around the full circle.
  final int waveCount;

  /// Thickness of the drawn wave and track arcs.
  final double strokeWidth;

  /// Color of the active (filled) wave arc.
  final Color activeColor;

  /// Color of the inactive (remaining) track arc.
  final Color inactiveColor;

  const WavyCircularProgressIndicator({
    super.key,
    this.value,
    this.size = 48,
    this.waveAmplitude = 3,
    this.waveCount = 10,
    this.strokeWidth = 4,
    this.activeColor = Colors.deepPurple,
    this.inactiveColor = const Color(0xFFE3DEF7),
  });

  @override
  State<WavyCircularProgressIndicator> createState() =>
      _WavyCircularProgressIndicatorState();
}

class _WavyCircularProgressIndicatorState
    extends State<WavyCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
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
          size: Size(widget.size, widget.size),
          painter: _WavyCircularPainter(
            progress: widget.value,
            rotation: _controller.value * 2 * math.pi,
            amplitude: widget.waveAmplitude,
            waveCount: widget.waveCount,
            strokeWidth: widget.strokeWidth,
            activeColor: widget.activeColor,
            inactiveColor: widget.inactiveColor,
          ),
        );
      },
    );
  }
}

class _WavyCircularPainter extends CustomPainter {
  final double? progress;
  final double rotation;
  final double amplitude;
  final int waveCount;
  final double strokeWidth;
  final Color activeColor;
  final Color inactiveColor;

  _WavyCircularPainter({
    required this.progress,
    required this.rotation,
    required this.amplitude,
    required this.waveCount,
    required this.strokeWidth,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide / 2) - strokeWidth * 2 - amplitude;

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

    // sweep: how much of the circle is "active" (wavy)
    final sweep = progress != null ? 2 * math.pi * progress! : 2 * math.pi * 0.75;
    final startAngle = -math.pi / 2 + rotation;

    // --- Inactive track (only for determinate mode) ---
    if (progress != null && sweep < 2 * math.pi) {
      final trackPath = Path();
      final gap = 0.15; // radians gap so ends don't overlap
      trackPath.addArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle + sweep + gap,
        (2 * math.pi - sweep) - gap * 2,
      );
      canvas.drawPath(trackPath, inactivePaint);
    }

    // --- Wavy active arc ---
    final wavePath = Path();
    const steps = 60; // Optimize: reduce steps from 200 down to 60
    bool started = false;
    final angleSpan = progress != null ? sweep : 2 * math.pi;
    for (int i = 0; i <= steps; i++) {
      final t = i / steps;
      final angle = startAngle + angleSpan * t;
      final wave = amplitude * math.sin(waveCount * angle);
      final r = radius + wave;
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);
      if (!started) {
        wavePath.moveTo(x, y);
        started = true;
      } else {
        wavePath.lineTo(x, y);
      }
    }
    canvas.drawPath(wavePath, activePaint);
  }

  @override
  bool shouldRepaint(covariant _WavyCircularPainter oldDelegate) => true;
}
