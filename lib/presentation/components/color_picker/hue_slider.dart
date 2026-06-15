part of 'color_picker_dialog.dart';

class HueSlider extends StatelessWidget {
  const HueSlider({required this.hue, required this.onChanged, super.key});

  final double hue;
  final void Function(double) onChanged;

  void _update(Offset local, BuildContext ctx) {
    final box = ctx.findRenderObject()! as RenderBox;
    final h = (local.dx / box.size.width * 360).clamp(0.0, 360.0);
    onChanged(h);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (d) => _update(d.localPosition, context),
      onPanUpdate: (d) => _update(d.localPosition, context),
      onTapDown: (d) => _update(d.localPosition, context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(height: 32, child: CustomPaint(painter: _HuePainter(hue))),
      ),
    );
  }
}

class _HuePainter extends CustomPainter {
  const _HuePainter(this.hue);

  final double hue;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          colors: [for (int i = 0; i <= 12; i++) HSVColor.fromAHSV(1, i * 30.0, 1, 1).toColor()],
        ).createShader(rect),
    );

    final dx = hue / 360 * size.width;
    canvas.drawLine(
      Offset(dx, 2),
      Offset(dx, size.height - 2),
      Paint()
        ..color = Colors.white
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_HuePainter old) => old.hue != hue;
}
