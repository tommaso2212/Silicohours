part of '../graph.dart';

extension ValuesExtension on List<double> {
  double get total => fold(0.0, (previousValue, element) => previousValue + element);

  double get maxValue => isNotEmpty ? (map((e) => e).toList()..sort()).last : 0;

  double getUpperBound({double rounding = 1}) => (maxValue / rounding).ceil() * rounding;
}
