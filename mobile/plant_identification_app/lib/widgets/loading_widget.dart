import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:plant_identification_app/constants/color_constants.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';

import '../constants/app_constants.dart';
import '../constants/teststyle_constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Dimensions.heightPadding20,
        width: Dimensions.widthPadding20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius8),
            boxShadow: [BoxShadows.defaultBoxShadow],
            color: Colors.white),
        child: Center(
            child: Column(
          children: [
            LoadingAnimationWidget.inkDrop(
                color: ColorPalette.primaryColor, size: 20),
            SizedBox(
              height: Dimensions.heightPadding20,
            ),
            Text(
              AppConstants.scan,
              style: TextStyles.defaultStyle.bold
                  .copyWith(color: ColorPalette.text1Color, fontSize: 16),
            ),
          ],
        )),
      ),
    );
  }
}
