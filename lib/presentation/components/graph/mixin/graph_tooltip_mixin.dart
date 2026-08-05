part of '../graph.dart';

mixin GraphTooltipPainter {
  TextStyle? get tooltipStyle;
  Color get tooltipBackgrounColor => tooltipStyle?.backgroundColor ?? AppColors.surface;

  EdgeInsets get tooltipPadding => EdgeInsets.all(8);
  Offset? get touchOffset;

  void paintTooltip(Canvas canvas, Size size, {required String tooltip, bool Function()? showTooltip}) {
    if (touchOffset == null) return;
    if (!(showTooltip?.call() ?? true)) return;

    final paint = Paint()
      ..color = tooltipBackgrounColor
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(
      text: TextSpan(text: tooltip, style: tooltipStyle),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
    )..layout();

    final offset = Offset(
      touchOffset!.dx - textPainter.width / 2,
      touchOffset!.dy - (textPainter.height + tooltipPadding.vertical),
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          offset.dx - tooltipPadding.left,
          offset.dy - tooltipPadding.top,
          textPainter.width + tooltipPadding.horizontal,
          textPainter.height + tooltipPadding.vertical,
        ),
        Radius.circular(8),
      ),
      paint,
    );

    textPainter.paint(canvas, offset);
  }

  bool isInCirle({required Offset center, required double radius}) {
    if (touchOffset == null) return false;
    return pow(touchOffset!.dx - center.dx, 2) + pow(touchOffset!.dy - center.dy, 2) < pow(radius, 2);
  }

  bool isInRect({required Rect rect}) {
    if (touchOffset == null) return false;

    final horizontalCheck = rect.left < touchOffset!.dx && rect.right > touchOffset!.dx;
    final verticalCheck = rect.bottom < touchOffset!.dy && rect.top > touchOffset!.dy;

    return horizontalCheck && verticalCheck;
  }

  bool isInCircleArc({
    required Offset center,
    required double radius,
    required double startAngle,
    required double sweepAngle,
  }) {
    if (touchOffset == null) return false;

    final currentRadians = atan2(touchOffset!.dy - center.dy, touchOffset!.dx - center.dx);
    final currentRadiansNormalized = currentRadians > 0 ? currentRadians : 2 * pi - currentRadians.abs();

    return currentRadiansNormalized > startAngle && currentRadiansNormalized <= startAngle + sweepAngle;
  }
}
