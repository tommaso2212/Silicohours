part of '../graph.dart';

class GraphHistogramPainter extends CustomPainter with GraphGridPainter, GraphTooltipPainter {
  GraphHistogramPainter({
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

  @override
  bool get hasVerticalLines => false;

  List<Rect> computeColumns(Size size, {double spacing = 4}) {
    final columns = List<Rect>.empty(growable: true);

    final heightPerValue = (size.height - descriptionPadding.vertical) / values.getUpperBound();
    final width = (size.width - descriptionPadding.horizontal) / values.length;

    for (var i = 0; i < values.length; i++) {
      final rect = Rect.fromLTWH(
        descriptionPadding.left + i * width + spacing,
        size.height - descriptionPadding.bottom,
        width - spacing * 2,
        -values[i] * heightPerValue,
      );
      columns.add(rect);
    }

    return columns;
  }

  void paintGraph(Canvas canvas, Size size, {required List<Rect> columns, Radius radius = const Radius.circular(8)}) {
    final graphPaint = Paint()..style = PaintingStyle.fill;

    for (var i = 0; i < columns.length; i++) {
      canvas.drawRRect(
        RRect.fromRectAndCorners(columns[i], topLeft: radius, topRight: radius),
        graphPaint..color = (colorBuilder?.call(i) ?? AppColors.primary),
      );
    }
  }

  void paintGraphTooltip(Canvas canvas, Size size, {required List<Rect> columns}) {
    if (tooltipBuilder == null) return;
    for (var i = 0; i < columns.length; i++) {
      final rect = columns[i];
      final tooltipRect = Rect.fromLTRB(
        rect.left,
        size.height - descriptionPadding.bottom,
        rect.right,
        0 + descriptionPadding.top,
      );

      paintTooltip(
        canvas,
        size,
        tooltip: tooltipBuilder!.call(i),
        showTooltip: () => isInRect(rect: tooltipRect),
      );
    }
  }

  void paintGrid(Canvas canvas, Size size, {double yStepNumber = 5}) {
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

    final columns = computeColumns(size);

    paintGraph(canvas, size, columns: columns);

    paintGraphTooltip(canvas, size, columns: columns);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
