/// Wavy progress indicators inspired by Material 3 Expressive guidelines.
///
/// Contains two custom-painted progress indicators:
/// - [WavyLinearProgressIndicator] — a wavy/squiggly horizontal bar
/// - [WavyCircularProgressIndicator] — a wavy/squiggly circular ring
///
/// Both support determinate (fixed value) and indeterminate (spinning)
/// modes via the [value] parameter.
///
/// ```dart
/// // Indeterminate — spinning continuously
/// WavyCircularProgressIndicator(value: null)
///
/// // Determinate — fixed at 65%
/// WavyCircularProgressIndicator(value: 0.65)
/// ```
import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A linear progress indicator with a wavy/squiggly filled portion,
/// similar to the Material 3 Expressive "wavy" progress bar.
class WavyLinearProgressIndicator extends StatefulWidget {
  final double? value; // 0.0 - 1.0, null = indeterminate
  final double height;
  final double waveAmplitude;
  final double waveLength;
  final double strokeWidth;
  final Color activeColor;
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

/// A circular progress indicator with a wavy/squiggly stroke,
/// matching the style of Material 3 Expressive circular loaders.
class WavyCircularProgressIndicator extends StatefulWidget {
  final double? value;
  final double size;
  final double waveAmplitude;
  final int waveCount; // number of bumps around the circle
  final double strokeWidth;
  final Color activeColor;
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
