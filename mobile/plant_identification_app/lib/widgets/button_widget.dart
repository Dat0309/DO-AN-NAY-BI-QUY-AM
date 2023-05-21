import 'package:flutter/material.dart';
import 'package:plant_identification_app/constants/teststyle_constants.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';

import '../constants/color_constants.dart';


class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.title, this.ontap, })
      : super(key: key);

  final String title;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.widthPadding15 - 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20 + 5),
          gradient: Gradients.defualtGradientBg,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyles.defaultStyle
              .copyWith(fontSize: 16, color: Colors.white,),
        ),
      ),
    );
  }
}
