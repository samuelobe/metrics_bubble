import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget that displays a weight (lbs) and a label for
/// strength assessment summaries
class MetricsBubble extends StatelessWidget {
  /// The label that is shown in the upper portion of the widget.
  final String label;

  /// The weight that is displayed in the middle portion of the widget.
  final int weight;

  /// The diameter for the bubble.
  final double? diameter;

  /// An optional decoration to modify the appearance of the bubble.
  final BoxDecoration? decoration;

  /// An optional style to modify the appearance of the label.
  final TextStyle? labelStyle;

  /// An optional style to modify the apperance of the weight.
  final TextStyle? weightStyle;

  /// An optional style to modify the appearance of the unit.
  final TextStyle? unitStyle;

  /// An optional onTap callback for registering a user touch action.
  final VoidCallback? onTap;

  const MetricsBubble(
      {Key? key,
      required this.label,
      required this.weight,
      this.diameter,
      this.decoration,
      this.labelStyle,
      this.weightStyle,
      this.unitStyle,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: decoration ?? BubbleConstants.kBubbleBoxDecoration,
        child: ClipOval(
          child: SizedBox(
            height: diameter ?? BubbleConstants.kBubbleDiameter,
            width: diameter ?? BubbleConstants.kBubbleDiameter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    'assets/graph.svg',
                    semanticsLabel: 'Bubble Graph',
                    width: diameter,
                  ),
                ),
                Center(
                  child: Text(
                    '$weight',
                    style: weightStyle ?? BubbleConstants.kWeightStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Positioned(
                  top: (diameter ?? BubbleConstants.kBubbleDiameter) * 0.15,
                  child: Text(
                    label,
                    style: labelStyle ?? BubbleConstants.kTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Positioned(
                  bottom: (diameter ?? BubbleConstants.kBubbleDiameter) * 0.1,
                  child: Text(
                    'lbs',
                    style: unitStyle ?? BubbleConstants.kUnitStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
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
