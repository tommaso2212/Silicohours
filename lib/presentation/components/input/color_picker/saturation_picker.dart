part of 'color_picker_dialog.dart';

class SaturationValuePicker extends StatelessWidget {
  const SaturationValuePicker({required this.hsv, required this.onChanged, super.key});

  final HSVColor hsv;
  final void Function(HSVColor) onChanged;

  void _update(Offset local, BuildContext ctx) {
    final box = ctx.findRenderObject()! as RenderBox;
    final s = (local.dx / box.size.width).clamp(0.0, 1.0);
    final v = 1.0 - (local.dy / box.size.height).clamp(0.0, 1.0);
    onChanged(hsv.withSaturation(s).withValue(v));
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: AppTheme.borderRadius,
        child: GestureDetector(
          onPanStart: (d) => _update(d.localPosition, context),
          onPanUpdate: (d) => _update(d.localPosition, context),
          onTapDown: (d) => _update(d.localPosition, context),
          child: CustomPaint(painter: _SaturationValuePainter(hsv)),
        ),
      ),
    );
  }
}

class _SaturationValuePainter extends CustomPainter {
  const _SaturationValuePainter(this.hsv);

  final HSVColor hsv;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final hueColor = HSVColor.fromAHSV(1, hsv.hue, 1, 1).toColor();

    canvas.drawRect(rect, Paint()..shader = LinearGradient(colors: [Colors.white, hueColor]).createShader(rect));
    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black],
        ).createShader(rect),
    );

    final center = Offset(hsv.saturation * size.width, (1 - hsv.value) * size.height);
    canvas.drawCircle(
      center,
      9,
      Paint()
        ..color = Colors.white
        ..strokeWidth = 2.5
        ..style = PaintingStyle.stroke,
    );
    canvas.drawCircle(center, 7, Paint()..color = hsv.toColor());
  }

  @override
  bool shouldRepaint(_SaturationValuePainter old) => old.hsv != hsv;
}
