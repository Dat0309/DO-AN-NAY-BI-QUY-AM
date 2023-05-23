import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_identification_app/constants/color_constants.dart';
import 'package:plant_identification_app/models/agricukture_model.dart';
import 'package:plant_identification_app/models/agriculture_recognition_model.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/views/other/detail_plant_screen.dart';

import '../constants/teststyle_constants.dart';

class ItemResutl extends StatelessWidget {
  final AgricultureRecognition agricultureRecognition;
  final Agriculture agriculture;
  const ItemResutl(
      {super.key,
      required this.agricultureRecognition,
      required this.agriculture});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.to(() => DetailPlantScreen(agriculture: agriculture,));
      }),
      child: Padding(
        padding: EdgeInsets.only(top: Dimensions.heightPadding15),
        child: Container(
          height: Dimensions.height120 - 20,
          width: Dimensions.widthPadding300 + 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius8),
              boxShadow: [BoxShadows.defaultBoxShadow],
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Dimensions.heightPadding60 + 20,
                  width: Dimensions.widthPadding60 + 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      image: DecorationImage(
                        image: NetworkImage(
                          agriculture.image!,
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.heightPadding30),
                  child: Text(
                    agriculture.commonName!,
                    style: TextStyles.defaultStyle.bold.copyWith(
                      fontSize: 16,
                      color: ColorPalette.text1Color,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.heightPadding30),
                  child: Text(
                    "${agricultureRecognition.percent!.ceil()}%",
                    style: TextStyles.defaultStyle.bold.copyWith(
                      fontSize: 16,
                      color: ColorPalette.text1Color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
