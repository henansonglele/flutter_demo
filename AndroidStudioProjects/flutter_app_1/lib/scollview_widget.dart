import 'package:flutter/material.dart';

class scrollview_widget extends StatelessWidget {
Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                Container(
                  // A fixed-height child.
                  color: const Color(0xff808000), // Yellow
                  height: 120.0,
                ),
                Container(
                  // A fixed-height child.
                  color: const Color(0xff608000), // Yellow
                  height: 120.0,
                ),
                Container(
                  // A fixed-height child.
                  color: const Color(0xff80500), // Yellow
                  height: 120.0,
                ),
                Container(
                  // A fixed-height child.
                  color: const Color(0xff804000), // Yellow
                  height: 120.0,
                ),
                Container(
                  // A fixed-height child.
                  color: const Color(0xff805000), // Yellow
                  height: 120.0,
                ),Container(
                  // A fixed-height child.
                  color: const Color(0xff108000), // Yellow
                  height: 120.0,
                ),
                Container(
                  // A fixed-height child.
                  color: const Color(0xff808000), // Yellow
                  height: 120.0,
                ),
                Container(
                  // A fixed-height child.
                  color: const Color(0xff608000), // Yellow
                  height: 120.0,
                ),
                Container(
                  // A fixed-height child.
                  color: const Color(0xff80500), // Yellow
                  height: 120.0,
                ),
                Expanded(//Expanding content to fit the viewport
                  // A flexible child that will grow to fit the viewport but
                  // still be at least as big as necessary to fit its contents.
                  child: Container(
                    color: const Color(0xff800000), // Red
                    height: 120.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
}