part of '../graph.dart';

mixin GraphGridPainter {
  TextStyle? get descriptionStyle;
  Color get gridColor => AppColors.onSurfaceMuted;
  Paint get gridPaint => Paint()
    ..color = gridColor
    ..style = PaintingStyle.stroke;

  EdgeInsets get descriptionPadding => const EdgeInsets.only(left: 32, bottom: 32);

  bool get hasVerticalLines => true;
  bool get hasHorizontalLines => true;

  void paintLineY(Canvas canvas, Size size, {required double y}) {
    final path = Path()
      ..moveTo(0 + descriptionPadding.left, y)
      ..lineTo(size.width - descriptionPadding.right, y);

    canvas.drawPath(path, gridPaint);
  }

  void paintLineX(Canvas canvas, Size size, {required double x}) {
    final path = Path()
      ..moveTo(x, 0 + descriptionPadding.top)
      ..lineTo(x, size.height - descriptionPadding.bottom);

    canvas.drawPath(path, gridPaint);
  }

  void paintDescriptionY(Canvas canvas, Size size, {required double y, String? description, double spacing = 4}) {
    if (description == null) return;

    final textPainter = TextPainter(
      text: TextSpan(text: description, style: descriptionStyle),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
      ellipsis: '..',
    );

    if (descriptionPadding.left > 0) {
      textPainter.layout(minWidth: descriptionPadding.left - spacing, maxWidth: descriptionPadding.left - (spacing));

      final offsetY = y - (textPainter.height / 2);

      textPainter.paint(canvas, Offset(-spacing, offsetY));
    }

    if (descriptionPadding.right > 0) {
      textPainter.textAlign = TextAlign.left;

      textPainter.layout(minWidth: descriptionPadding.right - spacing, maxWidth: descriptionPadding.right - spacing);
      final offsetY = y - (textPainter.height / 2);
      textPainter.paint(canvas, Offset(size.width - descriptionPadding.right + spacing, offsetY));
    }
  }

  void paintDescriptionX(
    Canvas canvas,
    Size size, {
    required double x,
    required double width,
    String? description,
    double spacing = 8,
  }) {
    if (description == null) return;

    final textPainter = TextPainter(
      text: TextSpan(text: description, style: descriptionStyle),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      ellipsis: '..',
    );
    textPainter.layout(minWidth: width, maxWidth: width);

    if (descriptionPadding.bottom > 0) {
      textPainter.paint(canvas, Offset(x, size.height - descriptionPadding.bottom + spacing));
    }

    if (descriptionPadding.top > 0) {
      textPainter.paint(canvas, Offset(x, descriptionPadding.top - textPainter.height - spacing));
    }
  }

  void paintHorizontalLine(Canvas canvas, Size size, {required double y, String? description}) {
    if (hasHorizontalLines) paintLineY(canvas, size, y: y);
    paintDescriptionY(canvas, size, y: y, description: description);
  }

  void paintVerticalLine(Canvas canvas, Size size, {required double x, required double width, String? description}) {
    if (hasVerticalLines) paintLineX(canvas, size, x: x);
    paintDescriptionX(canvas, size, x: x, width: width, description: description);
  }

  void paintProportionalHorizontalSteps(
    Canvas canvas,
    Size size, {
    required double horizontalSteps,
    String? Function(int index)? descriptionBuilder,
  }) {
    if (horizontalSteps <= 0) return;
    final horizontalStepHeight = (size.height - descriptionPadding.vertical) / horizontalSteps;
    for (var i = 0; i <= horizontalSteps; i++) {
      final y = i * horizontalStepHeight + descriptionPadding.top;
      final description = descriptionBuilder?.call(i);
      paintHorizontalLine(canvas, size, y: y, description: description);
    }
  }

  void paintProportionalVerticalSteps(
    Canvas canvas,
    Size size, {
    required double verticalSteps,
    String? Function(int index)? descriptionBuilder,
  }) {
    if (verticalSteps <= 0) return;
    final verticalStepHeight = (size.width - descriptionPadding.horizontal) / verticalSteps;
    for (var i = 0; i <= verticalStepHeight; i++) {
      final x = i * verticalStepHeight + descriptionPadding.left;
      final description = i < verticalSteps ? descriptionBuilder?.call(i) : null;
      paintVerticalLine(canvas, size, x: x, description: description, width: verticalStepHeight);
    }
  }

  void paintProportionalGrid(
    Canvas canvas,
    Size size, {
    String Function(int index)? yDescriptionBuilder,
    String Function(int index)? xDescriptionBuilder,
    double verticalSteps = 5,
    double horizontalSteps = 5,
  }) {
    paintProportionalHorizontalSteps(
      canvas,
      size,
      horizontalSteps: horizontalSteps,
      descriptionBuilder: yDescriptionBuilder,
    );
    paintProportionalVerticalSteps(canvas, size, verticalSteps: verticalSteps, descriptionBuilder: xDescriptionBuilder);
  }
}
