import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metrics_bubble/widgets/metrics_bubble.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  var label = 'Core';
  var weight = '123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MetricsBubble(
                label: label,
                weight: int.parse(weight),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff53a99a),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Label',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (str) => {
                              if (str.isNotEmpty)
                                {
                                  setState(() {
                                    label = str;
                                  })
                                }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: 'Type in your label',
                                fillColor: Colors.white70),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Weight',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+$')),
                            ],
                            onChanged: (str) => {
                              if (str.isNotEmpty)
                                {
                                  setState(() {
                                    weight = str;
                                  })
                                }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: 'Type in your weight',
                                fillColor: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
