part of '../graph.dart';

class GraphLinePainter extends CustomPainter with GraphGridPainter, GraphTooltipPainter {
  GraphLinePainter({
    required this.series,
    this.colorBuilder,
    this.xGridDescriptionBuilder,
    this.seriesTooltipBuilder,
    this.descriptionStyle,
    this.tooltipStyle,
    this.touchOffset,
  });

  final List<List<double>> series;

  /// Called with the series index (not the point index) to color each line.
  final Color Function(int index)? colorBuilder;
  final String Function(int index)? xGridDescriptionBuilder;
  final String Function(int seriesIndex, int valueIndex)? seriesTooltipBuilder;

  @override
  final TextStyle? descriptionStyle;

  @override
  final TextStyle? tooltipStyle;

  @override
  final Offset? touchOffset;

  double get pointRadius => 8;

  static const defaultSeriesColors = [
    AppColors.primary,
    AppColors.primaryLight,
    AppColors.error,
    AppColors.onSurfaceMuted,
  ];

  @override
  bool get hasVerticalLines => false;

  int get _pointCount => series.fold(0, (count, values) => max(count, values.length));

  Color _colorForSeries(int index) =>
      colorBuilder?.call(index) ?? defaultSeriesColors[index % defaultSeriesColors.length];

  List<List<Offset>> computeSeriesPoints(Size size) {
    final upperBound = series.expand((values) => values).toList().getUpperBound();
    final heightPerValue = (size.height - descriptionPadding.vertical) / upperBound;
    final width = (size.width - descriptionPadding.horizontal) / _pointCount;

    return series.map((values) {
      final points = List<Offset>.empty(growable: true);

      for (var i = 0; i < values.length; i++) {
        final x = descriptionPadding.left + i * width + width / 2;
        final y = (size.height - descriptionPadding.vertical) - values[i] * heightPerValue;

        points.add(Offset(x, y));
      }
      return points;
    }).toList();
  }

  void _paintLines(Canvas canvas, Size size, {required List<Offset> points, required Color color}) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = color;

    Offset? previousPoint;

    for (var i = 0; i < points.length; i++) {
      final point = points[i];

      if (previousPoint != null) canvas.drawLine(previousPoint, point, paint);

      previousPoint = point;
    }
  }

  void _paintPoints(Canvas canvas, Size size, {required List<Offset> points, required Color color}) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    for (var i = 0; i < points.length; i++) {
      canvas.drawCircle(points[i], pointRadius, paint);
    }
  }

  void paintGraph(Canvas canvas, Size size, {required List<List<Offset>> seriesPoints}) {
    for (var s = 0; s < seriesPoints.length; s++) {
      final color = _colorForSeries(s);
      _paintLines(canvas, size, points: seriesPoints[s], color: color);
      _paintPoints(canvas, size, points: seriesPoints[s], color: color);
    }
  }

  void paintGraphTooltip(Canvas canvas, Size size, {required List<List<Offset>> seriesPoints}) {
    if (seriesTooltipBuilder == null) return;
    for (var s = 0; s < seriesPoints.length; s++) {
      final points = seriesPoints[s];
      for (var i = 0; i < points.length; i++) {
        paintTooltip(
          canvas,
          size,
          tooltip: seriesTooltipBuilder!.call(s, i),
          showTooltip: () => isInCirle(center: points[i], radius: pointRadius),
        );
      }
    }
  }

  void paintGrid(Canvas canvas, Size size, {double yStepNumber = 4}) {
    final maxValue = series.expand((values) => values).toList().getUpperBound();
    final minValue = 0;

    final partial = (maxValue - minValue) / yStepNumber;

    paintProportionalGrid(
      canvas,
      size,
      yDescriptionBuilder: (index) => '${maxValue - index * partial}',
      xDescriptionBuilder: xGridDescriptionBuilder,
      horizontalSteps: yStepNumber.toDouble(),
      verticalSteps: _pointCount.toDouble(),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintGrid(canvas, size);

    final seriesPoints = computeSeriesPoints(size);

    paintGraph(canvas, size, seriesPoints: seriesPoints);

    paintGraphTooltip(canvas, size, seriesPoints: seriesPoints);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
