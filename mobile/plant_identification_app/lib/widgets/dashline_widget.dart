

import 'package:flutter/material.dart';
import 'package:plant_identification_app/constants/color_constants.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';


class DashLineWidget extends StatelessWidget {
  const DashLineWidget({Key? key, this.height = 1, this.color = ColorPalette.dividerColor}) : super(key: key);

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 6.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Padding(
          padding:  EdgeInsets.symmetric(vertical: Dimensions.widthPadding15),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount,
             (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}