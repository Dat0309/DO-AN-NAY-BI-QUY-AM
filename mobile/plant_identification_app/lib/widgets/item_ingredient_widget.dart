import 'package:flutter/material.dart';
import 'package:plant_identification_app/constants/color_constants.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';

import '../constants/teststyle_constants.dart';

class ItemIngredientWidget extends StatelessWidget {
  final String icon;
  final Color color;
  final String data;
  final String title;
  const ItemIngredientWidget(
      {super.key, required this.icon, required this.color, required this.data, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Dimensions.heightPadding60,
            width: Dimensions.widthPadding60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius8),
              color: color.withOpacity(0.2),
            ),
            child: SizedBox(
              height: Dimensions.iconSize24,
              child: Image.asset(
                icon,
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.widthPadding10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.whiteTextColor.bold
                    .copyWith(color: color, fontSize: 15),
              ),
              SizedBox(
                height: Dimensions.heightPadding8,
              ),
              Text(
                data,
                style: TextStyles.defaultStyle
                    .copyWith(color: ColorPalette.text1Color, fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
