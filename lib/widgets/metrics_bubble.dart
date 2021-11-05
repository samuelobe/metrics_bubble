import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// This widget displays a weight and a label for strength assessment summaries
class MetricsBubble extends StatelessWidget {
  /// Represents the type of workout
  final String label;

  /// Represents a value between 0 and 350 lbs
  final num weight;

  /// Represents the diamter of the bubble
  final double? diameter;

  /// Represents decoration of the widget
  final BoxDecoration? decoration;

  /// Represents an optional style for the label
  final TextStyle? labelStyle;

  /// Represents an optional style for the weight
  final TextStyle? weightStyle;

  /// Represents an optionals style for the unit
  final TextStyle? unitStyle;

  const MetricsBubble(
      {Key? key,
      required this.label,
      required this.weight,
      this.diameter,
      this.decoration,
      this.labelStyle,
      this.weightStyle,
      this.unitStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: diameter ?? BubbleConstants.kBubbleDiameter,
      width: diameter ?? BubbleConstants.kBubbleDiameter,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              decoration: decoration ?? BubbleConstants.kBubbleBoxDecoration),
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              'assets/graph.svg',
              semanticsLabel: 'Bubble Graph',
              width: diameter,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                child: Text(
                  label,
                  style: labelStyle ?? BubbleConstants.kTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Center(
                child: Text(
                  '$weight',
                  style: weightStyle ?? BubbleConstants.kWeightStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Center(
                child: Text(
                  'lbs',
                  style: unitStyle ?? BubbleConstants.kUnitStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

/// This class contains all of the constants used in the MetricsBubble widget
class BubbleConstants {
  /// Represents the default diameter if none is provided
  static const double kBubbleDiameter = 272;

  /// Represents the default style for the box decoration widget
  static const kBubbleBoxDecoration = BoxDecoration(
    color: Color(0xff53a99a),
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 27),
        blurRadius: 33,
        color: Color(0x3827ae96),
      )
    ],
  );

  /// Represents the default label style if none is provided
  static const kTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.bold,
    fontSize: 19,
    letterSpacing: 2,
    color: Colors.white,
  );

  /// Represents the default weight style if none is provided
  static const kWeightStyle = TextStyle(
    fontFamily: 'League Gothic',
    fontSize: 127,
    color: Colors.white,
  );

  /// Represents the default unit style if none is provided
  static const kUnitStyle = TextStyle(
    fontFamily: 'League Gothic',
    fontSize: 38,
    color: Color(0x80ffffff),
  );
}
