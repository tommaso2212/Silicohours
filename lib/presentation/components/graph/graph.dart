import 'dart:math';
import 'package:flutter/material.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

part 'mixin/graph_grid_mixin.dart';
part 'mixin/graph_tooltip_mixin.dart';

part 'painter/graph_line_painter.dart';
part 'painter/graph_histogram_painter.dart';
part 'painter/graph_donut_painter.dart';

part 'utils/graph_utils.dart';

enum _GraphType { line, histogram, donut }

class Graph extends StatefulWidget {
  const Graph.line({
    required this.series,
    this.colorBuilder,
    this.seriesTooltipBuilder,
    this.xGridDescriptionBuilder,
    this.constraints,
    super.key,
  }) : _graphType = _GraphType.line,
       values = const [],
       tooltipBuilder = null;

  const Graph.histogram({
    required this.values,
    this.colorBuilder,
    this.tooltipBuilder,
    this.xGridDescriptionBuilder,
    this.constraints,
    super.key,
  }) : _graphType = _GraphType.histogram,
       series = const [],
       seriesTooltipBuilder = null;

  const Graph.donut({required this.values, this.colorBuilder, this.tooltipBuilder, this.constraints, super.key})
    : _graphType = _GraphType.donut,
      series = const [],
      xGridDescriptionBuilder = null,
      seriesTooltipBuilder = null;

  final List<double> values;
  final List<List<double>> series;
  final String Function(int index)? tooltipBuilder;
  final String Function(int seriesIndex, int valueIndex)? seriesTooltipBuilder;
  final Color Function(int index)? colorBuilder;
  final String Function(int index)? xGridDescriptionBuilder;

  final BoxConstraints? constraints;

  final _GraphType _graphType;

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  Offset? touchOffset;

  void setTouchOffset(Offset? offset) => setState(() {
    touchOffset = offset;
  });

  @override
  Widget build(BuildContext context) {
    final descriptionStyle = Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.onSurfaceMuted);
    final tooltipStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: AppColors.onSurface, backgroundColor: AppColors.background);

    return ConstrainedBox(
      constraints: widget.constraints ?? const BoxConstraints(maxHeight: 200),
      child: MouseRegion(
        onHover: (event) => setTouchOffset(event.localPosition),
        onExit: (event) => setTouchOffset(null),
        child: CustomPaint(
          painter: switch (widget._graphType) {
            _GraphType.line => GraphLinePainter(
              series: widget.series,
              seriesTooltipBuilder: widget.seriesTooltipBuilder,
              touchOffset: touchOffset,
              descriptionStyle: descriptionStyle,
              tooltipStyle: tooltipStyle,
              colorBuilder: widget.colorBuilder,
              xGridDescriptionBuilder: widget.xGridDescriptionBuilder,
            ),
            _GraphType.histogram => GraphHistogramPainter(
              values: widget.values,
              tooltipBuilder: widget.tooltipBuilder,
              touchOffset: touchOffset,
              descriptionStyle: descriptionStyle,
              tooltipStyle: tooltipStyle,
              colorBuilder: widget.colorBuilder,
              xGridDescriptionBuilder: widget.xGridDescriptionBuilder,
            ),
            _GraphType.donut => GraphDonutPainter(
              values: widget.values,
              tooltipBuilder: widget.tooltipBuilder,
              touchOffset: touchOffset,
              tooltipStyle: tooltipStyle,
              colorBuilder: widget.colorBuilder,
            ),
          },
          child: SizedBox.expand(),
        ),
      ),
    );
  }
}
