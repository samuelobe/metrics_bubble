import 'package:flutter/material.dart';

class MetricsBubble extends StatelessWidget {
  /// Represents the type of workout
  final String label;

  /// Represents a value between 0 and 350 lbs
  final int weight;

  /// Represents decoration of the widget
  final BoxDecoration decoration;

  /// Represents the diamter of the bubble
  final double diameter;

  const MetricsBubble(
      {Key? key,
      required this.label,
      required this.weight,
      required this.decoration,
      required this.diameter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: diameter,
      width: diameter,
      decoration: decoration
    );
  }
}
