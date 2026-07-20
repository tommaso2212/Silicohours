part of '../graph.dart';

class GraphLinePainter extends CustomPainter with GraphGridPainter, GraphTooltipPainter {
  GraphLinePainter({
    required this.values,
    this.colorBuilder,
    this.xGridDescriptionBuilder,
    this.tooltipBuilder,
    this.descriptionStyle,
    this.tooltipStyle,
    this.touchOffset,
  });

  final List<double> values;
  final Color Function(int index)? colorBuilder;
  final String Function(int index)? xGridDescriptionBuilder;
  final String Function(int index)? tooltipBuilder;

  @override
  final TextStyle? descriptionStyle;

  @override
  final TextStyle? tooltipStyle;

  @override
  final Offset? touchOffset;

  double get pointRadius => 8;

  @override
  bool get hasVerticalLines => false;

  List<Offset> computePoints(Size size) {
    final points = List<Offset>.empty(growable: true);

    final heightPerValue = (size.height - descriptionPadding.vertical) / values.getUpperBound();
    final width = (size.width - descriptionPadding.horizontal) / values.length;

    for (var i = 0; i < values.length; i++) {
      final x = descriptionPadding.left + i * width + width / 2;
      final y = (size.height - descriptionPadding.vertical) - values[i] * heightPerValue;

      points.add(Offset(x, y));
    }
    return points;
  }

  void _paintLines(Canvas canvas, Size size, {required List<Offset> points}) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = AppColors.primary;

    Offset? previousPoint;

    for (var i = 0; i < points.length; i++) {
      final point = points[i];

      if (previousPoint != null) canvas.drawLine(previousPoint, point, paint);

      previousPoint = point;
    }
  }

  void _paintPoints(Canvas canvas, Size size, {required List<Offset> points}) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var i = 0; i < points.length; i++) {
      canvas.drawCircle(points[i], pointRadius, paint..color = (colorBuilder?.call(i) ?? AppColors.primary));
    }
  }

  void paintGraph(Canvas canvas, Size size, {required List<Offset> points}) {
    _paintLines(canvas, size, points: points);
    _paintPoints(canvas, size, points: points);
  }

  void paintGraphTooltip(Canvas canvas, Size size, {required List<Offset> points}) {
    if (tooltipBuilder == null) return;
    for (var i = 0; i < points.length; i++) {
      paintTooltip(
        canvas,
        size,
        tooltip: tooltipBuilder!.call(i),
        showTooltip: () => isInCirle(center: points[i], radius: pointRadius),
      );
    }
  }

  void paintGrid(Canvas canvas, Size size, {double yStepNumber = 4}) {
    final maxValue = values.getUpperBound();
    final minValue = 0;

    final partial = (maxValue - minValue) / yStepNumber;

    paintProportionalGrid(
      canvas,
      size,
      yDescriptionBuilder: (index) => '${maxValue - index * partial}',
      xDescriptionBuilder: xGridDescriptionBuilder,
      horizontalSteps: yStepNumber.toDouble(),
      verticalSteps: values.length.toDouble(),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintGrid(canvas, size);

    final points = computePoints(size);

    paintGraph(canvas, size, points: points);

    paintGraphTooltip(canvas, size, points: points);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
