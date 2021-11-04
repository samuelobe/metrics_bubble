import 'package:flutter/material.dart';

class Metrics extends StatefulWidget {
  final String label;
  final int weight;
  final Color color;

  const Metrics({Key? key, required this.label, required this.weight, required this.color})
      : super(key: key);

  @override
  _MetricsState createState() => _MetricsState();
}

class _MetricsState extends State<Metrics> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
