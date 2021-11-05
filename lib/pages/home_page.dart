import 'package:flutter/material.dart';
import 'package:metrics_bubble/widgets/metrics_bubble.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: const [
            MetricsBubble(
              label: 'Core',
              weight: 123,
            ),
          ],
        ));
  }
}
