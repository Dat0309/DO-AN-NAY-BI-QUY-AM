import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_identification_app/models/agricukture_model.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/views/other/detail_plant_screen.dart';

import '../constants/teststyle_constants.dart';
import '../helper/image_helper.dart';

class ItemPlantWidget extends StatelessWidget {
  const ItemPlantWidget({super.key, required this.agriculture});
  final Agriculture agriculture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.to(() => DetailPlantScreen(agriculture: agriculture,));
      }),
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.widthPadding15 + 1),
        child: Stack(children: [
          Container(
            width: Dimensions.width150,
            height: Dimensions.height200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                image: DecorationImage(
                  image: NetworkImage(
                    agriculture.image!,
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
            right: Dimensions.widthPadding5,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.widthPadding15 + 1),
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
              left: Dimensions.widthPadding15 + 1,
              bottom: Dimensions.widthPadding10 + 5,
              child: Container(
                padding: EdgeInsets.all(Dimensions.widthPadding5 + 2),
                decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(Dimensions.radius8)),
                child: Text(
                  agriculture.commonName!,
                  style: TextStyles.defaultStyle.whiteTextColor.bold,
                ),
              )),
        ]),
      ),
    );
  }
}
