

import 'package:flutter/material.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';

import '../constants/teststyle_constants.dart';

class ItemCategoryWidget extends StatelessWidget {
  final String icon;
  final String name;
  final Color color;
  const ItemCategoryWidget({super.key, required this.name, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.widthPadding15),
      child: Column(
        children: [
          Container(
            height: Dimensions.heightPadding60,
            width: Dimensions.widthPadding60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle
            ),
            child: SizedBox(
                height: Dimensions.iconSize24,
                child: Image.asset(
                  icon,
                ),
              ) ,
          ),
          SizedBox(height: Dimensions.heightPadding8,),
          Text(
            name,
            style: TextStyles.defaultStyle.copyWith(fontSize: 10),
          ),
        ],
        
      ),
    );
  }
}