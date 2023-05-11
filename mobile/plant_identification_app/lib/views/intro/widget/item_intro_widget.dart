import 'package:flutter/material.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';

import '../../../constants/teststyle_constants.dart';
import '../../../helper/image_helper.dart';


class ItemIntroWidget extends StatelessWidget {
  const ItemIntroWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.sourceImage,
    required this.aligment,
  }) : super(key: key);

  final String title;
  final String description;
  final String sourceImage;
  final AlignmentGeometry aligment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container( 
          alignment: aligment,
          child: ImageHelper.loadFromAsset(
            sourceImage,
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(
          height: (Dimensions.heightPadding20 + 4) * 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.heightPadding20 + 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: Dimensions.heightPadding20 + 4,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}