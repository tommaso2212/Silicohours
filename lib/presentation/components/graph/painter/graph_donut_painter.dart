part of '../graph.dart';

class GraphDonutPainter extends CustomPainter with GraphTooltipPainter {
  GraphDonutPainter({
    required this.values,
    this.colorBuilder,
    this.tooltipBuilder,
    this.tooltipStyle,
    this.touchOffset,
  });

  final List<double> values;
  final Color Function(int index)? colorBuilder;
  final String Function(int index)? tooltipBuilder;

  @override
  final TextStyle? tooltipStyle;

  @override
  final Offset? touchOffset;

  double get strokeWidth => 32;

  List<(double, double)> computeStartAndSweepAngles() {
    final angles = List<(double, double)>.empty(growable: true);

    final radiantValue = 2 * pi / values.total;

    double startAngle = 0;
    for (final radiant in values.map((e) => e * radiantValue)) {
      angles.add((startAngle, radiant));
      startAngle = startAngle + radiant;
    }

    return angles;
  }

  void paintGraph(
    Canvas canvas,
    Size size, {
    required List<(double, double)> angles,
    required Offset center,
    required double radius,
  }) {
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromCircle(center: center, radius: radius);

    for (var i = 0; i < angles.length; i++) {
      final angle = angles[i];

      canvas.drawArc(
        rect.deflate(strokeWidth / 2),
        angle.$1,
        angle.$2,
        false,
        paint..color = (colorBuilder?.call(i) ?? AppColors.primary),
      );
    }
  }

  void paintGraphTooltip(
    Canvas canvas,
    Size size, {
    required List<(double, double)> angles,
    required Offset center,
    required double radius,
  }) {
    if (tooltipBuilder == null) return;

    for (var i = 0; i < angles.length; i++) {
      final angle = angles[i];
      paintTooltip(
        canvas,
        size,
        tooltip: tooltipBuilder!.call(i),
        showTooltip: () =>
            isInCirle(center: center, radius: radius) &&
            !isInCirle(center: center, radius: radius - strokeWidth) &&
            isInCircleArc(center: center, radius: radius, startAngle: angle.$1, sweepAngle: angle.$2),
      );
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.shortestSide / 2);
    final radius = size.shortestSide / 2;

    final angles = computeStartAndSweepAngles();

    paintGraph(canvas, size, angles: angles, center: center, radius: radius);
    paintGraphTooltip(canvas, size, angles: angles, center: center, radius: radius);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
