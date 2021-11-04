import 'package:flutter/material.dart';
import 'package:metrics_bubble/widgets/metrics_bubble.dart';
import 'package:metrics_bubble/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const Center(
          child: MetricsBubble(
            label: 'Upper Body',
            weight: 123,
            decoration: bubbleBoxDecoration,
            diameter: 26,
          ),
        ));
  }
}
