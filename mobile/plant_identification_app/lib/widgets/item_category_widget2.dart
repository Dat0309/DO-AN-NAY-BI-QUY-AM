

import 'package:flutter/material.dart';
import 'package:plant_identification_app/constants/teststyle_constants.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';

class ItemCateogryWidget2 extends StatelessWidget {
  final String icon;
  final String name;
  final Color color;
  const ItemCateogryWidget2({super.key, required this.icon, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height140 + 10,
      width: Dimensions.width140 + 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        color: color
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: Dimensions.heightPadding45 + 10),
          child: Column(
            children: [
               SizedBox(
                  height: Dimensions.iconSize50,
                  child: Image.asset(
                    icon,
                    fit: BoxFit.cover,
                  ),
                ) ,
            
            SizedBox(height: Dimensions.heightPadding20,),
            Text(
              name,
              style: TextStyles.defaultStyle.bold.copyWith(fontSize: 15),
            ),

            ],
          ),
        ),
      ) ,
    );
  }
}